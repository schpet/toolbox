---
name: jj
description: Jujutsu (jj) version control workflows and commands. Use this skill when working with jj repositories, managing changes, squashing commits, rebasing, or performing jj-specific operations.
---

# Jujutsu (jj) Version Control

Jujutsu is a Git-compatible version control system with first-class support for working copy changes, anonymous branches, and operation history.

## When to Use

- Managing jj changes and revisions
- Squashing, splitting, or reorganizing commits
- Working with bookmarks (jj's equivalent of git branches)
- Rebasing and editing commit history
- Understanding jj-specific concepts and commands

## Agent Usage

When reading data from jj, always use `--ignore-working-copy` to avoid snapshotting the working copy (which is slow and unnecessary for read operations).

For structured output, use the JSON template:

```bash
jj log --ignore-working-copy --no-graph -r '::' -T 'json(self) ++ "\n"'
```

This outputs one JSON object per line, which is easy to parse programmatically. The `json(self)` template works with most jj commands that support `-T`.

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


- [Bookmarks](references/bookmarks.md)
- [Config](references/config.md)
- [Filesets](references/filesets.md)
- [Glossary](references/glossary.md)
- [Revsets](references/revsets.md)
- [Templates](references/templates.md)
- [Tutorial](references/tutorial.md)

## Command Reference

Documentation generated from jj manpages. For details on any command, read the corresponding reference file.

### Bisect

- [jj-bisect-run](references/jj-bisect-run.md)

### Bookmark

- [jj-bookmark-create](references/jj-bookmark-create.md)
- [jj-bookmark-delete](references/jj-bookmark-delete.md)
- [jj-bookmark-forget](references/jj-bookmark-forget.md)
- [jj-bookmark-list](references/jj-bookmark-list.md)
- [jj-bookmark-move](references/jj-bookmark-move.md)
- [jj-bookmark-rename](references/jj-bookmark-rename.md)
- [jj-bookmark-set](references/jj-bookmark-set.md)
- [jj-bookmark-track](references/jj-bookmark-track.md)
- [jj-bookmark-untrack](references/jj-bookmark-untrack.md)

### Config

- [jj-config-edit](references/jj-config-edit.md)
- [jj-config-get](references/jj-config-get.md)
- [jj-config-list](references/jj-config-list.md)
- [jj-config-path](references/jj-config-path.md)
- [jj-config-set](references/jj-config-set.md)
- [jj-config-unset](references/jj-config-unset.md)

### File

- [jj-file-annotate](references/jj-file-annotate.md)
- [jj-file-chmod](references/jj-file-chmod.md)
- [jj-file-list](references/jj-file-list.md)
- [jj-file-show](references/jj-file-show.md)
- [jj-file-track](references/jj-file-track.md)
- [jj-file-untrack](references/jj-file-untrack.md)

### General

- [jj](references/jj.md)
- [jj-abandon](references/jj-abandon.md)
- [jj-absorb](references/jj-absorb.md)
- [jj-bisect](references/jj-bisect.md)
- [jj-bookmark](references/jj-bookmark.md)
- [jj-commit](references/jj-commit.md)
- [jj-config](references/jj-config.md)
- [jj-describe](references/jj-describe.md)
- [jj-diff](references/jj-diff.md)
- [jj-diffedit](references/jj-diffedit.md)
- [jj-duplicate](references/jj-duplicate.md)
- [jj-edit](references/jj-edit.md)
- [jj-evolog](references/jj-evolog.md)
- [jj-file](references/jj-file.md)
- [jj-fix](references/jj-fix.md)
- [jj-gerrit](references/jj-gerrit.md)
- [jj-git](references/jj-git.md)
- [jj-help](references/jj-help.md)
- [jj-interdiff](references/jj-interdiff.md)
- [jj-log](references/jj-log.md)
- [jj-metaedit](references/jj-metaedit.md)
- [jj-new](references/jj-new.md)
- [jj-next](references/jj-next.md)
- [jj-operation](references/jj-operation.md)
- [jj-parallelize](references/jj-parallelize.md)
- [jj-prev](references/jj-prev.md)
- [jj-rebase](references/jj-rebase.md)
- [jj-redo](references/jj-redo.md)
- [jj-resolve](references/jj-resolve.md)
- [jj-restore](references/jj-restore.md)
- [jj-revert](references/jj-revert.md)
- [jj-root](references/jj-root.md)
- [jj-show](references/jj-show.md)
- [jj-sign](references/jj-sign.md)
- [jj-sparse](references/jj-sparse.md)
- [jj-split](references/jj-split.md)
- [jj-squash](references/jj-squash.md)
- [jj-status](references/jj-status.md)
- [jj-tag](references/jj-tag.md)
- [jj-undo](references/jj-undo.md)
- [jj-unsign](references/jj-unsign.md)
- [jj-util](references/jj-util.md)
- [jj-version](references/jj-version.md)
- [jj-workspace](references/jj-workspace.md)

### Gerrit

- [jj-gerrit-upload](references/jj-gerrit-upload.md)

### Git

- [jj-git-clone](references/jj-git-clone.md)
- [jj-git-colocation](references/jj-git-colocation.md)
- [jj-git-colocation-disable](references/jj-git-colocation-disable.md)
- [jj-git-colocation-enable](references/jj-git-colocation-enable.md)
- [jj-git-colocation-status](references/jj-git-colocation-status.md)
- [jj-git-export](references/jj-git-export.md)
- [jj-git-fetch](references/jj-git-fetch.md)
- [jj-git-import](references/jj-git-import.md)
- [jj-git-init](references/jj-git-init.md)
- [jj-git-push](references/jj-git-push.md)
- [jj-git-remote](references/jj-git-remote.md)
- [jj-git-remote-add](references/jj-git-remote-add.md)
- [jj-git-remote-list](references/jj-git-remote-list.md)
- [jj-git-remote-remove](references/jj-git-remote-remove.md)
- [jj-git-remote-rename](references/jj-git-remote-rename.md)
- [jj-git-remote-set-url](references/jj-git-remote-set-url.md)
- [jj-git-root](references/jj-git-root.md)

### Operation

- [jj-operation-abandon](references/jj-operation-abandon.md)
- [jj-operation-diff](references/jj-operation-diff.md)
- [jj-operation-log](references/jj-operation-log.md)
- [jj-operation-restore](references/jj-operation-restore.md)
- [jj-operation-revert](references/jj-operation-revert.md)
- [jj-operation-show](references/jj-operation-show.md)

### Simplify

- [jj-simplify-parents](references/jj-simplify-parents.md)

### Sparse

- [jj-sparse-edit](references/jj-sparse-edit.md)
- [jj-sparse-list](references/jj-sparse-list.md)
- [jj-sparse-reset](references/jj-sparse-reset.md)
- [jj-sparse-set](references/jj-sparse-set.md)

### Tag

- [jj-tag-delete](references/jj-tag-delete.md)
- [jj-tag-list](references/jj-tag-list.md)
- [jj-tag-set](references/jj-tag-set.md)

### Util

- [jj-util-completion](references/jj-util-completion.md)
- [jj-util-config-schema](references/jj-util-config-schema.md)
- [jj-util-exec](references/jj-util-exec.md)
- [jj-util-gc](references/jj-util-gc.md)
- [jj-util-install-man-pages](references/jj-util-install-man-pages.md)
- [jj-util-markdown-help](references/jj-util-markdown-help.md)

### Workspace

- [jj-workspace-add](references/jj-workspace-add.md)
- [jj-workspace-forget](references/jj-workspace-forget.md)
- [jj-workspace-list](references/jj-workspace-list.md)
- [jj-workspace-rename](references/jj-workspace-rename.md)
- [jj-workspace-root](references/jj-workspace-root.md)
- [jj-workspace-update-stale](references/jj-workspace-update-stale.md)

---
*Generated from jj manpages (jj 0.36.0)*

## License

The content in the `references/` directory is derived from the [jj (Jujutsu) project](https://github.com/jj-vcs/jj) and is licensed under the [Apache License 2.0](https://github.com/jj-vcs/jj/blob/main/LICENSE).