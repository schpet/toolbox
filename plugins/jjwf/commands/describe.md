---
description: Generate and set a description for the current jj change based on the diff
---

# Describe

Generate a commit description from the current diff and apply it with `jj describe -m`, preserving any existing trailers and ID prefixes.

## Workflow

1. **Get the current description** (to check for existing content):
   ```bash
   jj log -r @ --ignore-working-copy --no-graph -T 'description'
   ```

2. **Get the current diff**:
   ```bash
   jj diff --git
   ```

3. **Parse the existing description** (if any):
   - **ID prefix**: Check if the first line starts with an issue/ticket ID pattern like `ABC-123`, `PROJ-456`, `#123`, etc. These typically appear at the start of the first line, possibly followed by a colon or space.
   - **Trailers**: Look for git-style trailers at the end of the message. Trailers are lines matching `Key: Value` or `Key #Value` format, like:
     - `Co-authored-by: Name <email>`
     - `Fixes #123`
     - `Reviewed-by: Name`
     - `Change-Id: I...`

4. **Generate a new description** based on the diff:
   - Summarize what changed in a clear, concise message
   - Use imperative mood (e.g., "Add feature" not "Added feature")
   - First line should be a brief summary

5. **Compose the final description**:
   - If there was an ID prefix, prepend it to the new first line (e.g., `ABC-123 Add new feature`)
   - Add the generated description body
   - If there were trailers, append them at the end (separated by a blank line)

6. **Apply the description**:
   ```bash
   jj describe -m "Your composed message"
   ```

7. **Show the result**:
   ```bash
   jj log -r @ --ignore-working-copy
   ```

## Examples

### Preserving an ID prefix

Existing description:
```
ABC-123
```

After `/describe` with changes that add a login feature:
```
ABC-123 Add user login functionality
```

### Preserving trailers

Existing description:
```
Some old description

Co-authored-by: Alice <alice@example.com>
Change-Id: I1234567890
```

After `/describe`:
```
Add new feature based on diff

Co-authored-by: Alice <alice@example.com>
Change-Id: I1234567890
```

### Preserving both

Existing description:
```
PROJ-789 Old description

Reviewed-by: Bob <bob@example.com>
```

After `/describe` with changes that fix a bug:
```
PROJ-789 Fix null pointer exception in parser

Reviewed-by: Bob <bob@example.com>
```

## Notes

- Common ID prefix patterns: `ABC-123`, `PROJ-456`, `#123`, `GH-123`
- Common trailer keys: `Co-authored-by`, `Signed-off-by`, `Reviewed-by`, `Fixes`, `Closes`, `Change-Id`
- If the diff is empty, inform the user there are no changes to describe
- The `-m` flag is required to avoid opening an editor
