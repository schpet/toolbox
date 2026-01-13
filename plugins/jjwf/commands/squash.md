---
description: Squash the current jj change into its parent
---

# Squash

Squash the current jj change into its parent commit.

## Workflow

1. **Check current state** (optional, for context):
   ```bash
   jj log -r @::@- --ignore-working-copy
   ```

2. **Run squash**:
   ```bash
   jj squash
   ```

   This moves all changes from the current commit into its parent.

3. **Show the result**:
   ```bash
   jj log -r @ --ignore-working-copy
   ```

## Notes

- `jj squash` without arguments squashes into the immediate parent
- If the parent has a description and the current commit doesn't, the parent's description is preserved
- If both have descriptions, use `-m "message"` to provide a combined message, or `-u` to keep the destination's message
- After squashing, the current change becomes empty and you'll be working on the (now modified) parent
