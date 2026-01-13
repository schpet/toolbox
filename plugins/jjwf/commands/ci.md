---
description: Commit the current jj change with an auto-generated description
---

# CI (Commit)

Commit the current jj change by generating a description from the diff and running `jj ci -m`.

## Workflow

1. **Get the current diff**:
   ```bash
   jj diff --git
   ```

2. **Generate a commit message** based on the diff:
   - Summarize what changed in a clear, concise message
   - Use imperative mood (e.g., "Add feature" not "Added feature")
   - First line should be a brief summary (50 chars or less if possible)
   - If more detail is needed, add a blank line followed by a body

3. **Commit the change**:
   ```bash
   jj ci -m "Your generated message"
   ```

   Note: `jj ci` is an alias for `jj commit`. It commits the current change and creates a new empty change on top.

4. **Show the result**:
   ```bash
   jj log -r @- --ignore-working-copy
   ```

## Notes

- If the diff is empty, inform the user there's nothing to commit
- The `-m` flag is required to avoid opening an editor
- After `jj ci`, the working copy (`@`) will be a new empty change, and the committed change is at `@-`
