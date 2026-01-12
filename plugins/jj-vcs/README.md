# jj-vcs

Instructions and manpages for your agent to work with [Jujutsu (jj)](https://github.com/jj-vcs/jj) version control.

## Installation

Add the marketplace:

```bash
claude plugin marketplace add schpet/toolbox
```

Install the plugin:

```bash
claude plugin install jj-vcs@toolbox
```

Restart Claude Code after installation.

## Usage

```bash
cd ~/path/to/your-jj-repo
claude "use the jj skill to cleanup mutable commits: describe, squash and split as needed"
```

Or invoke the skill directly:

```
/jj
```
