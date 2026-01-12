# Toolbox

Claude Code plugin marketplace with jj-vcs, changelog, svbump, chores, and speccer plugins.

## Docs

- [Releasing](docs/releasing.md) - How to release new versions

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
