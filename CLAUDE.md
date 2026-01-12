# Toolbox

Claude Code plugin marketplace with jj-vcs, changelog, svbump, chores, and speccer plugins.

## Agents

use the jj skill to work on this project

## Docs

- [Releasing](docs/releasing.md) - How to release new versions
- [Updating jj-vcs docs](plugins/jj-vcs/docs/updating-jj-docs.md) - Regenerate jj skill when jj is updated

## Development

Install plugins locally for testing:
```bash
just claude-install-local
```

After making changes to plugins, fully uninstall and reinstall:
```bash
just claude-reinstall-local
```
