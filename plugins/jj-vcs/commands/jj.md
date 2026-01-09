---
description: Jujutsu (jj) version control help and documentation. Use this when working with jj repositories or when you need to look up jj commands, revsets, templates, or other jj concepts.
---

# Jujutsu (jj) Help

Provide jj version control assistance. This command gives access to comprehensive jj documentation including all command manpages.

## When Invoked

When the user invokes `/jj` or asks about jj:

1. **Answer questions directly** using knowledge from the skill's reference documentation
2. **Look up specific commands** by reading the corresponding reference file (e.g., `references/jj-rebase.md` for rebase questions)
3. **Help with revsets and templates** using `references/revsets.md` and `references/templates.md`

## Using the Reference Documentation

The skill includes comprehensive jj documentation in the `references/` directory:

### Topics
- `references/bookmarks.md` - Bookmark management
- `references/config.md` - Configuration options
- `references/filesets.md` - Fileset syntax
- `references/glossary.md` - jj terminology
- `references/revsets.md` - Revset expressions (very commonly needed)
- `references/templates.md` - Template language
- `references/tutorial.md` - Getting started guide

### Command Manpages
All jj commands have corresponding reference files named `jj-<command>.md`. For subcommands, use `jj-<command>-<subcommand>.md`.

Examples:
- `jj rebase` docs: `references/jj-rebase.md`
- `jj git push` docs: `references/jj-git-push.md`
- `jj bookmark create` docs: `references/jj-bookmark-create.md`

## Agent Best Practices

When executing jj commands:

- Use `--ignore-working-copy` for read operations to avoid slow snapshots
- For structured output, use: `jj log --ignore-working-copy --no-graph -r '::' -T 'json(self) ++ "\n"'`

## Examples of Questions This Helps With

- "How do I squash commits in jj?"
- "What's the revset syntax for finding all mutable commits?"
- "How do I push to a specific remote in jj?"
- "What templates can I use with jj log?"
- "How do bookmarks work in jj vs git branches?"
