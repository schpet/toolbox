# Releasing

## Steps

1. Add changelog entry:
   ```bash
   changelog add --type added "Description of change"
   ```
   Types: `added`, `changed`, `deprecated`, `removed`, `fixed`, `security`

2. Release new version:
   ```bash
   changelog release patch  # or minor, major
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

## Tools Used

- **changelog** - CLI for managing CHANGELOG.md (installed via this plugin)
- **svbump** - Bumps versions in JSON/TOML files (used by `just bump-versions`)
- **just** - Task runner (see `justfile` for all recipes)
