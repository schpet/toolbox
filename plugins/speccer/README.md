# Speccer

Transform rough ideas into structured project specifications with actionable issues.

## Usage

Invoke the skill with your rough input:

```
/speccer

[paste your rough notes, bullet points, or reference a file]
```

### Commands

| Command | Description |
|---------|-------------|
| `/speccer` | Start fresh - analyze new input |
| `/speccer refine` | Continue refining an existing spec |
| `/speccer issues` | Generate issues from completed spec |
| `/speccer issues --beads` | Generate issues and create beads |

## What It Does

1. **Decomposition** - Identifies feature/domain areas from your input
2. **Deep Analysis** - Spawns sub-agents to analyze each area in parallel
3. **Consolidation** - Gathers all ambiguities and questions
4. **Clarification** - Asks you questions in batches
5. **Refinement** - Updates specs with your answers
6. **Issue Generation** - Produces actionable issues with acceptance criteria

## Output

All documents are created in `docs/specs/`:

```
docs/specs/
├── index.md           # Top-level overview (the "source of truth")
├── _questions.md      # Pending questions
├── _issues.md         # Generated issues
└── {feature}.md       # One file per feature area
```

## Resuming Work

The `index.md` file tracks status. When you return to a project:

1. Speccer reads `index.md` to see current phase
2. Picks up where you left off (answering questions, refining, etc.)

## Example

```
/speccer

Building a CLI tool for managing dotfiles:
- sync dotfiles across machines
- support for machine-specific configs
- integrate with git for versioning
- maybe some kind of bootstrap script?
- need to handle secrets somehow
```

Speccer will identify features like "sync mechanism", "machine-specific configs", "git integration", "secrets management" and analyze each, asking things like:

- "How should conflicts be resolved when syncing?"
- "Should secrets be encrypted or excluded entirely?"
- "What's the target OS support?"

After clarification, you get issues like:

```
Issue: Implement two-way dotfile sync
Acceptance Criteria:
- [ ] Detects local changes since last sync
- [ ] Pulls remote changes from git
- [ ] Prompts user on conflicts
- [ ] Creates backup before overwriting
```
