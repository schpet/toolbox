---
name: jjwf
description: Jujutsu (jj) workflow skill. This skill should be used when the project uses jj for version control instead of git. Provides guidance on using jj commands and references the jj-vcs skill for detailed documentation.
---

# Jujutsu (jj) Workflow

This project uses Jujutsu (jj) for version control instead of git.

## Key Differences from Git

- **No staging area**: All changes in the working directory are automatically part of the current change
- **Changes vs commits**: jj uses "changes" (identified by change IDs) rather than commits
- **Automatic snapshots**: The working copy is automatically snapshotted
- **Immutable history**: By default, only "mutable" commits can be modified

## Common Workflow Commands

| Task | Command |
|------|---------|
| See current status | `jj status` |
| View diff | `jj diff --git` |
| Commit current change | `jj ci -m "message"` or `jj commit -m "message"` |
| Set/update description | `jj describe -m "message"` |
| Squash into parent | `jj squash` |
| Create new change | `jj new` |
| Push to remote | `jj git push` |
| Fetch from remote | `jj git fetch` |
| Cleanup empty commits | `/cleanup` |

## Agent Guidelines

When working in this repository:

1. **Use jj, not git**: All version control operations should use jj commands
2. **Always use `-m` flag**: For `jj describe`, `jj commit`, and `jj squash` to avoid opening an editor
3. **Use `--ignore-working-copy`**: For read operations like `jj log` and `jj diff` when you don't need the latest snapshot
4. **Use `--git` for diffs**: `jj diff --git` produces standard unified diff format

## For More Information

For detailed jj documentation, command references, revset syntax, and templates, invoke the `/jj` command or reference the jj-vcs skill.
