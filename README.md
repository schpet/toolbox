# toolbox

a dumping ground for teaching the llm new tricks.

## Plugins

### jj-vcs

Jujutsu (jj) version control documentation and workflows.

- Complete command reference from jj manpages (110 commands)
- In-depth topic guides (revsets, templates, filesets, etc.)
- Agent usage patterns for structured JSON output

### changelog

Manage project changelogs following the [Keep a Changelog](https://keepachangelog.com) format.

- Add entries: `changelog add --type added "feature description"`
- Release versions: `changelog release patch`
- Review git commits: `changelog review`

### svbump

Read and write semantic versions in config files (JSON, TOML, YAML).

- Read versions: `svbump read version package.json`
- Bump versions: `svbump write patch version package.json`
- Preview changes: `svbump preview minor version deno.json`

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
claude plugin install jj-vcs@toolbox
claude plugin install changelog@toolbox
claude plugin install svbump@toolbox
```

Restart Claude Code after installation.

## Updating

```bash
claude plugin install jj-vcs@toolbox
claude plugin install changelog@toolbox
claude plugin install svbump@toolbox
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
