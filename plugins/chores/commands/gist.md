---
description: Create a secret GitHub gist from provided content
---

# Gist

Create a secret GitHub gist from the provided content using the gh CLI.

## Usage

The user provides content (code, text, notes, etc.) as an argument to this command.

## Workflow

1. Take the content provided by the user

2. Create a unique temp file and write content to it:
   ```bash
   mktemp -t gist.md
   ```
   This returns a path like `/var/folders/.../gist.md.XXXXXX`. Use the Write tool to write the user's content to this path.

3. Create a secret gist using the gh CLI (gists are secret by default):
   ```bash
   gh gist create <temp-file-path>
   ```

4. Report the gist URL to the user (the temp file persists for reference)

## Notes

- Gists are created as **secret** by default (no flag needed)
- The gh CLI must be authenticated (`gh auth status` to check)
- If the user wants a public gist, add `-p` or `--public` flag
