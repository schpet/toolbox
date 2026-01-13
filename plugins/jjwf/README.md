# jjwf

Jujutsu (jj) workflow commands for Claude Code.

## Installation

```bash
claude plugin marketplace add schpet/toolbox
claude plugin install jjwf@toolbox
```

## Commands

- `/ci` - Commit with auto-generated message
- `/describe` - Update description (preserves ID prefixes and trailers)
- `/squash` - Squash into parent
- `/catchup` - Fetch and rebase onto trunk
- `/clone <url>` - Clone repo and track default bookmark
- `/pr` - Clean up mutable commits and create a pull request

## Related

- **[jj-vcs](../jj-vcs/README.md)** - Comprehensive jj documentation
