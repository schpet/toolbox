# Spec Document Template

Template for the single spec document (`docs/spec.md`) created by speccer.

```markdown
# Project: [Name]

## Overview

[2-3 sentence summary of the entire project scope]

## Tech Stack

| Component | Choice | Notes |
|-----------|--------|-------|
| Language | [e.g., Rust, Ruby, TypeScript] | [Version if specific] |
| Framework | [e.g., Axum, Rails 8, Next.js] | |
| Database | [e.g., PostgreSQL, SQLite, none] | |
| Package Manager | [e.g., cargo, bundler, pnpm] | |

## Status

**Current Phase**: [Foundation | Decomposition | Analysis | Clarification | Refinement | Complete]
**Progress**: [Brief note on what's done/pending]

## Project Setup

### Prerequisites

| Tool | Version | Installation |
|------|---------|--------------|
| [Tool name] | [Version or "latest"] | [Install command or link] |

### Scaffolding

```bash
# Step 1: [Description]
[command]
```

### Configuration Choices

| Choice | Decision | Rationale |
|--------|----------|-----------|
| Database | [e.g., PostgreSQL] | [Why this choice] |

---

## Features

### [Feature A]

#### Summary

[2-3 sentences describing what this feature area covers and its core purpose]

#### Key Requirements

- [Requirement 1]: [Brief description]
- [Requirement 2]: [Brief description]

#### Ambiguities & Questions

1. **[Question summary]**
   - Context: [Why this matters for implementation]

#### Decisions

- Q1: [Answer received, or "Pending"]

#### Suggested Issues

- **[Issue title]**: [Brief description]. Acceptance criteria: [testable criteria].

---

### [Feature B]

[Same structure as Feature A]

---

## Open Questions

Questions awaiting user clarification:

### [Feature Area]

1. **[Question]** — [Context for why this matters]. Status: Pending
2. **[Question]** — [Context]. Status: Answered — [answer]

---

## Issues

Total issues: X

### Implementation Order

**Setup issues come first**, then features ordered by dependency.

### Setup

#### [Issue Title]

**Description**: [What this accomplishes]

**Acceptance Criteria**:
- [ ] [Testable criterion 1]
- [ ] [Testable criterion 2]

**Labels**: setup

---

### [Feature A]

#### [Issue Title]

**Description**: [What this accomplishes]

**Acceptance Criteria**:
- [ ] [Testable criterion 1]
- [ ] [Testable criterion 2]

**Labels**: [feature-area]
**Depends on**: [Other issues, if any]

---

## Original Input

<details>
<summary>Click to expand original rough notes</summary>

[Paste or summarize original input here for reference]

</details>

## Notes

[Any project-wide constraints, preferences, or context]
```
