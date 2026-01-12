# Toolbox

Claude Code plugin marketplace with jj-vcs, changelog, svbump, chores, and speccer plugins.

## Docs

- [Releasing](docs/releasing.md) - How to release new versions

## Development

Install plugins locally for testing:
```bash
just claude-install-local
```

After making changes to plugins, fully uninstall and reinstall:
```bash
just claude-remove-local
just claude-install-local
```
