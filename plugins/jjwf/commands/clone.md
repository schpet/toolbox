---
description: Clone a Git repository with jj and track the default bookmark
---

# Clone

Clone a Git repository using jj and set up tracking for the default bookmark (main/master).

## Usage

```
/clone <repo-url>
```

The repo URL can be:
- A GitHub URL: `https://github.com/owner/repo`
- A Git URL: `https://github.com/owner/repo.git`
- An SSH URL: `git@github.com:owner/repo.git`

## Workflow

1. **Clone the repository**:
   ```bash
   jj git clone <repo-url>
   ```

   This creates a colocated jj/git repository (the default) where both `jj` and `git` commands work.

2. **Change into the cloned directory**:
   ```bash
   cd <repo-name>
   ```

3. **Check which remote bookmarks exist**:
   ```bash
   jj bookmark list --all-remotes
   ```

4. **Track the default bookmark** (typically `main` or `master`):
   ```bash
   jj bookmark track main@origin
   ```

   Or if the repo uses `master`:
   ```bash
   jj bookmark track master@origin
   ```

   This creates a local bookmark that tracks the remote, so `jj git fetch` will update it.

5. **Show the result**:
   ```bash
   jj log --limit 5
   ```

## Notes

- By default, `jj git clone` creates a colocated repository where both jj and git commands work
- The `trunk()` revset will automatically resolve to the tracked main/master bookmark
- After cloning, you're on a new empty change with the default bookmark as its parent
- Use `jj new` to start working, or just start editing files (changes are auto-tracked)

## Example

```
/clone https://github.com/jj-vcs/jj
```

This will:
1. Clone the jj repository
2. Set up tracking for the main branch
3. Leave you ready to start working
