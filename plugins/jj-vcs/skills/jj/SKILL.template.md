---
name: jj
description: Jujutsu (jj) version control workflows and commands. Use this skill when working with jj repositories, managing changes, squashing commits, rebasing, or performing jj-specific operations.
---

# Jujutsu (jj) Version Control

## Agent Usage

When reading data from jj, always use `--ignore-working-copy` to avoid snapshotting the working copy (which is slow and unnecessary for read operations).

### Non-interactive Commands (Critical)

Many jj commands spawn `$EDITOR` or interactive diff tools by default. **These will hang indefinitely when run by agents.** Always use the non-interactive alternatives:

| Command | Problem | Solution |
|---------|---------|----------|
| `jj describe` | Opens editor | Always use `-m "message"` |
| `jj commit` | Opens editor | Always use `-m "message"` |
| `jj split` | Opens diff editor + may open editor for description | Provide filesets to select files; use `-m` for description |
| `jj squash` | May open editor for combined description | Use `-m "message"` or `-u` (use destination message) |

**Commands to avoid entirely** (no non-interactive mode):
- `jj diffedit` — use `jj restore` or edit files directly instead
- `jj config edit` — use `jj config set <key> <value>` instead
- `jj sparse edit` — use `jj sparse set --add <path>` or `--remove <path>` instead
- `jj resolve` — edit conflict markers directly in files, or use `--tool :ours` / `--tool :theirs`

### Agent-Friendly Output Formats

jj's default diff and conflict formats differ from Git's. For easier parsing, use Git-compatible formats:

**Diffs:** Use the `--git` flag for unified diff output:
```bash
jj diff --git
jj log -p --git
jj show --git
```

**Conflicts:** jj uses diff-based conflict markers by default (`%%%%%%%`, `+++++++`). For standard Git-style markers (`<<<<<<<`, `=======`, `>>>>>>>`), pass `--config` when running commands that may create conflicts:
```bash
jj --config ui.conflict-marker-style=git rebase ...
jj --config ui.conflict-marker-style=git new --insert-before ...
```

The conflict style is applied when conflicts are materialized to the working copy, so the config must be set *before* the conflict occurs.

**JSON:** For structured/programmatic output, use the `json(self)` template:
```bash
jj log --ignore-working-copy --no-graph -T 'json(self) ++ "\n"'
```
Outputs one JSON object per line with commit_id, change_id, description, author, etc. Works with `jj log`, `jj show`, and other commands that support `-T`.

## Common Commands

| Command | Description |
|---------|-------------|
| `jj status` | Show working copy status |
| `jj log` | Show commit history |
| `jj new` | Create a new change |
| `jj describe -m "msg"` | Set commit message |
| `jj squash` | Squash into parent |
| `jj diff` | Show changes |
| `jj git push` | Push to remote |
| `jj git fetch` | Fetch from remote |
| `jj bookmark create name` | Create a bookmark |

## Topics

In-depth guides on jj concepts and syntax.

{{TOPICS}}

## Command Reference

Documentation generated from jj manpages. For details on any command, read the corresponding reference file.

{{COMMANDS}}

---
*Generated from jj manpages ({{VERSION}})*

## License

The content in the `references/` directory is derived from the [jj (Jujutsu) project](https://github.com/jj-vcs/jj) and is licensed under the [Apache License 2.0](https://github.com/jj-vcs/jj/blob/main/LICENSE).
