#!/usr/bin/env -S deno run --allow-run --allow-read --allow-write

import { join, basename, dirname } from "jsr:@std/path";

const SCRIPT_DIR = dirname(new URL(import.meta.url).pathname);
const REPO_ROOT = join(SCRIPT_DIR, "..");
const SKILL_DIR = join(REPO_ROOT, "skills", "jj");
const SKILL_DOCS_DIR = join(SKILL_DIR, "references");
const SKILL_MD = join(SKILL_DIR, "SKILL.md");

async function run(cmd: string[]): Promise<{ success: boolean; stdout: string; stderr: string }> {
  const command = new Deno.Command(cmd[0], {
    args: cmd.slice(1),
    stdout: "piped",
    stderr: "piped",
  });
  const result = await command.output();
  return {
    success: result.success,
    stdout: new TextDecoder().decode(result.stdout).trim(),
    stderr: new TextDecoder().decode(result.stderr).trim(),
  };
}

async function findManpageDir(): Promise<string> {
  const result = await run(["man", "-w", "jj"]);
  if (!result.success || !result.stdout) {
    console.error("Error: Could not find jj manpage. Is jj installed?");
    Deno.exit(1);
  }
  return dirname(result.stdout);
}

async function checkPandoc(): Promise<void> {
  const result = await run(["which", "pandoc"]);
  if (!result.success) {
    console.error("Error: pandoc is required but not installed");
    console.error("Install with: brew install pandoc");
    Deno.exit(1);
  }
}

async function getJjVersion(): Promise<string> {
  const result = await run(["jj", "--version"]);
  return result.success ? result.stdout.split("\n")[0] : "unknown";
}

async function convertManpage(manpage: string, outputFile: string): Promise<boolean> {
  const result = await run(["pandoc", "-f", "man", "-t", "markdown", "--wrap=none", manpage, "-o", outputFile]);
  return result.success;
}

async function getManpages(manpageDir: string): Promise<string[]> {
  const manpages: string[] = [];
  for await (const entry of Deno.readDir(manpageDir)) {
    // Check name pattern (entry could be file or symlink)
    if (entry.name.startsWith("jj") && entry.name.endsWith(".1")) {
      manpages.push(join(manpageDir, entry.name));
    }
  }
  return manpages.sort();
}

function getCategory(cmd: string): string {
  if (cmd === "jj") {
    return "general";
  }
  const match = cmd.match(/^jj-([a-z]+)-.*$/);
  if (match) {
    return match[1];
  }
  return "general";
}

function capitalize(str: string): string {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

const HELP_TOPICS = ["bookmarks", "config", "filesets", "glossary", "revsets", "templates", "tutorial"] as const;

async function generateHelpTopic(topic: string, outputFile: string): Promise<boolean> {
  const result = await run(["jj", "help", "-k", topic]);
  if (!result.success) {
    return false;
  }

  // jj help output already includes a header, so just use it directly
  await Deno.writeTextFile(outputFile, result.stdout + "\n");
  return true;
}

function generateSkillMd(commands: string[], helpTopics: string[], jjVersion: string): string {
  const lines: string[] = [];

  // Header
  lines.push(`---
name: jj
description: Jujutsu (jj) version control workflows and commands. Use this skill when working with jj repositories, managing changes, squashing commits, rebasing, or performing jj-specific operations.
---

# Jujutsu (jj) Version Control

## Agent Usage

When reading data from jj, always use \`--ignore-working-copy\` to avoid snapshotting the working copy (which is slow and unnecessary for read operations).

For structured output, use the JSON template:

\`\`\`bash
jj log --ignore-working-copy --no-graph -r '::' -T 'json(self) ++ "\\n"'
\`\`\`

This outputs one JSON object per line, which is easy to parse programmatically. The \`json(self)\` template works with most jj commands that support \`-T\`.

## Common Commands

| Command | Description |
|---------|-------------|
| \`jj status\` | Show working copy status |
| \`jj log\` | Show commit history |
| \`jj new\` | Create a new change |
| \`jj describe -m "msg"\` | Set commit message |
| \`jj squash\` | Squash into parent |
| \`jj diff\` | Show changes |
| \`jj git push\` | Push to remote |
| \`jj git fetch\` | Fetch from remote |
| \`jj bookmark create name\` | Create a bookmark |

## Topics

In-depth guides on jj concepts and syntax.

`);

  for (const topic of helpTopics) {
    lines.push(`- [${capitalize(topic)}](references/${topic}.md)`);
  }
  lines.push("");

  lines.push(`## Command Reference

Documentation generated from jj manpages. For details on any command, read the corresponding reference file.
`);

  // Group commands by category
  const categories = new Map<string, string[]>();
  for (const cmd of commands) {
    const category = getCategory(cmd);
    if (!categories.has(category)) {
      categories.set(category, []);
    }
    categories.get(category)!.push(cmd);
  }

  // Sort categories alphabetically
  const sortedCategories = [...categories.keys()].sort();

  // Output each category
  for (const category of sortedCategories) {
    const cmds = categories.get(category)!;
    lines.push(`### ${capitalize(category)}`);
    lines.push("");
    for (const cmd of cmds) {
      lines.push(`- [${cmd}](references/${cmd}.md)`);
    }
    lines.push("");
  }

  // Footer
  lines.push(`---
*Generated from jj manpages (${jjVersion})*

## License

The content in the \`references/\` directory is derived from the [jj (Jujutsu) project](https://github.com/jj-vcs/jj) and is licensed under the [Apache License 2.0](https://github.com/jj-vcs/jj/blob/main/LICENSE).
`);

  return lines.join("\n");
}

async function main() {
  await checkPandoc();

  const manpageDir = await findManpageDir();
  console.log(`Using manpage directory: ${manpageDir}`);

  const manpages = await getManpages(manpageDir);
  if (manpages.length === 0) {
    console.error(`Error: No jj manpages found in ${manpageDir}`);
    Deno.exit(1);
  }
  console.log(`Found ${manpages.length} jj manpages`);

  // Create temp directory for atomic update
  const tmpDir = await Deno.makeTempDir();

  console.log("Converting manpages to markdown...");
  const commands: string[] = [];

  for (const manpage of manpages) {
    const cmd = basename(manpage, ".1");
    const outputFile = join(tmpDir, `${cmd}.md`);

    if (await convertManpage(manpage, outputFile)) {
      console.log(`  Converted: ${cmd}`);
      commands.push(cmd);
    } else {
      console.log(`  Warning: Failed to convert ${cmd}`);
    }
  }

  console.log(`Successfully converted ${commands.length} manpages`);

  if (commands.length === 0) {
    console.error("Error: No manpages were converted");
    await Deno.remove(tmpDir, { recursive: true });
    Deno.exit(1);
  }

  // Generate help topic files
  console.log("Generating help topic files...");
  const generatedTopics: string[] = [];
  for (const topic of HELP_TOPICS) {
    const outputFile = join(tmpDir, `${topic}.md`);
    if (await generateHelpTopic(topic, outputFile)) {
      console.log(`  Generated: ${topic}`);
      generatedTopics.push(topic);
    } else {
      console.log(`  Warning: Failed to generate ${topic}`);
    }
  }
  console.log(`Successfully generated ${generatedTopics.length} help topics`);

  // Atomic replacement
  console.log(`Updating ${SKILL_DOCS_DIR}...`);
  try {
    await Deno.remove(SKILL_DOCS_DIR, { recursive: true });
  } catch {
    // Directory might not exist
  }
  await Deno.mkdir(dirname(SKILL_DOCS_DIR), { recursive: true });
  await Deno.rename(tmpDir, SKILL_DOCS_DIR);

  // Generate SKILL.md
  console.log("Generating SKILL.md...");
  const jjVersion = await getJjVersion();
  const skillContent = generateSkillMd(commands.sort(), generatedTopics, jjVersion);
  await Deno.writeTextFile(SKILL_MD, skillContent);

  const totalFiles = commands.length + generatedTopics.length;
  console.log(`Done! Generated ${totalFiles} markdown files in ${SKILL_DOCS_DIR}`);
  console.log(`Updated ${SKILL_MD}`);
}

main();
