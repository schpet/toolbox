# Toolbox

Claude Code plugin marketplace with jj-vcs, changelog, svbump, chores, and speccer plugins.

## Releasing

1. Add changelog entry:
   ```bash
   changelog add --type added "Description of change"
   ```

2. Release new version (patch/minor/major):
   ```bash
   changelog release patch
   ```

3. Bump all plugin versions to match:
   ```bash
   just bump-versions
   ```

4. Squash and describe the release commit:
   ```bash
   jj squash -m "Release vX.Y.Z: Summary of changes"
   ```

5. Push:
   ```bash
   jj bookmark set main -r @-
   jj git push
   ```

## Development

Install plugins locally for testing:
```bash
just claude-install-local
```

For faster iteration (changes picked up on Claude restart without reinstall):
```bash
just claude-symlink-dev
```

Update installed plugins:
```bash
just claude-update
```
