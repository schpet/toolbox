---
description: Prepare and push a pull request from mutable commits
---

# PR

Interactive workflow to clean up mutable commits and create a pull request.

## Workflow

### Step 1: Review the current state

First, check the current working copy and recent ancestors:

```bash
jj log -r '@:: | @- | @--' --ignore-working-copy
```

Also check the diff in the working copy:

```bash
jj diff --git
```

And list all mutable commits:

```bash
jj log -r 'mutable()' --ignore-working-copy --no-graph
```

### Step 2: Handle the working copy (@)

Check if the working copy has changes:

```bash
jj diff --stat
```

If the working copy has changes but no description:
- Check if @- is mutable: `jj log -r '@- & mutable()' --ignore-working-copy --no-graph`
- If @- is mutable, ask: "Squash into parent, or add a description to @?"
  - If squash: `jj squash` (squashes @ into @-)
  - If describe: Generate a description based on the diff and run `jj describe -m "<message>"`

If the working copy is empty (no changes), it will be handled in the next step.

### Step 3: Handle empty commits

Check for empty mutable commits:

```bash
jj log -r 'mutable() & empty()' --ignore-working-copy --no-graph
```

If there are empty commits, ask if they should be abandoned:

```bash
jj abandon 'mutable() & empty()'
```

### Step 4: Review @- and @--

Check if @- and @-- are mutable and could be squashed:

```bash
jj log -r '(@- | @--) & mutable()' --ignore-working-copy --no-graph
```

If both @- and @-- are mutable non-empty commits, ask if the user wants to squash them together.

If yes:
```bash
jj squash -r @- --into @--
```

Then generate a new description preserving any ID prefixes (like `ABC-123`) and trailers (like `Co-authored-by:`).

### Step 5: Handle commits without descriptions

Check for mutable commits without descriptions:

```bash
jj log -r 'mutable() & description(exact:"")' --ignore-working-copy --no-graph
```

For each commit without a description:
- Show its diff: `jj diff -r <rev> --git`
- Ask: "Generate a description, or squash into another commit?"
- If generate: `jj describe -r <rev> -m "<generated message>"`
- If squash and there's a parent to squash into: `jj squash -r <rev>`

### Step 6: Consider squashing all mutable commits

If there are multiple non-empty mutable commits remaining, ask if the user wants to squash them all into one:

```bash
jj squash --from 'mutable() ~ @' --into 'roots(mutable() ~ @)'
```

Generate a new combined description, preserving ID prefixes and trailers from existing descriptions.

### Step 7: Push and create bookmark

Determine which commit to push (the tip of mutable commits, excluding empty working copy):

```bash
jj log -r 'heads(mutable() ~ (@ & empty()))' --ignore-working-copy --no-graph -T 'change_id.short() ++ "\n"'
```

Push with auto-generated bookmark:

```bash
jj git push -c <change-id>
```

Note the bookmark name from the output (e.g., `push-abcdefgh`).

### Step 8: Create pull request (optional)

Ask if the user wants to create a pull request.

If yes:

```bash
gh pr create --head <bookmark-name> --title "<title>" --body "<body>"
```

Use the commit description as the basis for the PR title (first line) and body (rest).

## Notes

- The `mutable()` revset includes all commits that aren't immutable
- Always preserve ID prefixes (like `ABC-123`, `PROJ-456`) at the start of descriptions
- Always preserve trailers (like `Co-authored-by:`, `Signed-off-by:`) at the end of descriptions
- The `-c` flag on `jj git push` creates a bookmark for the specified revision
- If push fails, inform the user and don't proceed to PR creation
