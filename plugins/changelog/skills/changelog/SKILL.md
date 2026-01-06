---
name: changelog
description: Manage project changelogs following the Keep a Changelog format. This skill should be used when working with CHANGELOG.md files, adding changelog entries, releasing versions, or reviewing git commits for changelog purposes.
---

# Changelog CLI

A command line tool for managing changelogs following the [Keep a Changelog](https://keepachangelog.com) format.

## Adding Entries

To add a changelog entry, use the `changelog add` command:

```
changelog add --type <TYPE> <DESCRIPTION>
```

**Change types:**
- `added` (alias: `a`) - New features
- `changed` (alias: `c`) - Changes in existing functionality
- `deprecated` (alias: `d`) - Soon-to-be removed features
- `removed` (alias: `r`) - Removed features
- `fixed` (alias: `f`) - Bug fixes
- `security` (alias: `s`) - Security fixes

**Entry Style Guide:**

*Voice & Tense:*
- Use present tense to describe new behavior: "X now supports Y"
- Use past tense for removals/fixes: "Fixed X", "X has been removed"
- Describe the state, don't command: "Commands now accept..." not "Make commands accept..."

*Formatting:*
- Description should be lowercase (except proper nouns)
- Keep descriptions concise but informative

**Examples:**
```
changelog add --type added "commands now accept multiple arguments"
changelog add --type fixed "login bug that prevented oauth flow"
changelog add --type changed "error messages now include more context"
changelog add --type removed "deprecated v1 api endpoints have been removed"
```

To add an entry to a specific version instead of Unreleased:
```
changelog add --type fixed --version 1.0.1 "critical security patch"
```

## Releasing Versions

To release the Unreleased section as a new version:

```
# Automatic semver increment
changelog release major  # 1.0.0 -> 2.0.0
changelog release minor  # 1.0.0 -> 1.1.0
changelog release patch  # 1.0.0 -> 1.0.1

# Explicit version
changelog release 1.0.0

# With custom date
changelog release 1.0.0 --date 2025-01-01
```

## Reviewing Git Commits

To interactively review git commits and add them to the changelog:

```
changelog review
```

This opens an interactive selection interface similar to `git rebase -i`. Commits with conventional commit prefixes (`feat:`, `fix:`) are pre-selected. After selection, an editor opens to categorize and reword entries.

## Version Information

```
# Get latest version
changelog version latest

# List all versions
changelog version list

# Get git revision range for a version
changelog version range 1.0.0
```

## Other Commands

```
# Show a specific version's entries
changelog entry 1.0.0
changelog entry latest
changelog entry unreleased

# Format the changelog file
changelog fmt

# Initialize a new changelog
changelog init

# Generate shell completions
changelog completions bash
changelog completions zsh
changelog completions fish
```

## Integration Notes

Do not manually edit CHANGELOG.md when the changelog CLI is available. Use `changelog add` to add entries programmatically, ensuring proper formatting and structure.
