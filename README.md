# toolbox

a dumping ground for teaching the llm new tricks.

## Plugins

### jj-vcs

Jujutsu (jj) version control documentation and workflows.

- Complete command reference from jj manpages (110 commands)
- In-depth topic guides (revsets, templates, filesets, etc.)
- Agent usage patterns for structured JSON output

## Installation

### Add the marketplace

From Claude Code:
```
/plugin marketplace add schpet/toolbox
```

From bash:
```bash
claude plugin marketplace add schpet/toolbox
```

### Install plugins

```bash
# Install jj-vcs
claude plugin install jj-vcs@toolbox
```

Restart Claude Code after installation.

## Updating

```bash
claude plugin install jj-vcs@toolbox
```

## Local development

```bash
git clone https://github.com/schpet/toolbox
cd toolbox

# Install marketplace and plugins from local directory
just claude-install-local
```

### Regenerating jj-vcs docs

Requires `jj` and `pandoc`:

```bash
just generate-jj-docs
```
