# toolbox

a dumping ground for teaching the llm new tricks.

## Plugins

| Plugin | Description |
|--------|-------------|
| **[jj-vcs](plugins/jj-vcs/README.md)** | Jujutsu (jj) version control documentation and workflows |
| **[jjwf](plugins/jjwf/README.md)** | Jujutsu workflow commands: `/ci`, `/describe`, `/squash`, `/catchup`, `/clone`, `/pr` |
| **changelog** | Manage project changelogs following the [Keep a Changelog](https://keepachangelog.com) format |
| **svbump** | Read and write semantic versions in config files (JSON, TOML, YAML) |
| **chores** | Jujutsu repository maintenance and Apple container utilities |
| **[speccer](plugins/speccer/README.md)** | Distill rough ideas into structured project specs with issues |
| **[restate](plugins/restate/README.md)** | Restate durable execution framework documentation and patterns |

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
claude plugin install jjwf@toolbox
claude plugin install changelog@toolbox
claude plugin install svbump@toolbox
claude plugin install chores@toolbox
claude plugin install speccer@toolbox
claude plugin install restate@toolbox
```

Restart Claude Code after installation.

## Updating

```bash
claude plugin install jj-vcs@toolbox
claude plugin install jjwf@toolbox
claude plugin install changelog@toolbox
claude plugin install svbump@toolbox
claude plugin install chores@toolbox
claude plugin install speccer@toolbox
claude plugin install restate@toolbox
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
