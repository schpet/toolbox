# Updating jj-vcs Documentation

The jj skill documentation is auto-generated from jj's manpages. When a new version of jj is released, regenerate the docs to pick up new commands and changes.

## Prerequisites

- `jj` installed and updated to the target version
- `pandoc` installed (`brew install pandoc`)
- `deno` installed

## Quick Update

```bash
# Update jj to latest version
brew upgrade jj

# Regenerate docs
just generate-jj-docs

# Reinstall local plugins to test
just claude-reinstall-local
```

## How It Works

The generation script (`plugins/jj-vcs/scripts/generate-jj-docs.ts`):

1. Finds jj manpages from the system (`man -w jj`)
2. Converts each manpage to markdown using pandoc
3. Generates help topic files (`jj help -k <topic>`)
4. Writes all files to `skills/jj/references/`
5. Generates `SKILL.md` from the template file

## File Structure

```
plugins/jj-vcs/skills/jj/
├── SKILL.md              # Generated - DO NOT EDIT DIRECTLY
├── SKILL.template.md     # Template with agent notes - EDIT THIS
└── references/           # Generated markdown files
    ├── jj.md
    ├── jj-rebase.md
    ├── revsets.md
    └── ...
```

## Editing Agent Notes

To update the agent usage documentation (non-interactive commands, output formats, etc.):

1. Edit `plugins/jj-vcs/skills/jj/SKILL.template.md`
2. Run `just generate-jj-docs` to regenerate `SKILL.md`

The template uses placeholders that get replaced during generation:
- `{{TOPICS}}` - List of help topics
- `{{COMMANDS}}` - Categorized command reference
- `{{VERSION}}` - jj version string

## Releasing Updates

After regenerating docs:

```bash
# Add changelog entry
changelog add --type changed "Update jj-vcs documentation to jj X.Y"

# Release
changelog release patch
just bump-versions

# Commit and push
jj describe -m "Release vX.Y.Z: Update jj-vcs documentation"
jj bookmark set main -r @
jj git push

# Tag the release
jj tag set vX.Y.Z -r @-
git push origin vX.Y.Z
```
