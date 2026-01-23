# Document Templates

Templates for the spec documents created by speccer.

## Setup Document Template

Use this structure for the project foundation document (`docs/specs/_setup.md`):

```markdown
# Project Setup

This document defines the technical foundation for the project, including toolchain requirements, scaffolding steps, and initial configuration.

## Prerequisites

Install these before starting development:

### [Language/Runtime]

| Tool | Version | Installation |
|------|---------|--------------|
| [Tool name] | [Version or "latest"] | [Install command or link] |
| [Tool name] | [Version or "latest"] | [Install command or link] |

**Verification**:
```bash
[command to verify installation, e.g., "rustc --version"]
```

## Project Scaffolding

Run these commands to initialize the project:

```bash
# Step 1: [Description]
[command]

# Step 2: [Description]
[command]
```

## Configuration Choices

Decisions made during project setup:

| Choice | Decision | Rationale |
|--------|----------|-----------|
| Database | [e.g., PostgreSQL] | [Why this choice] |
| Package manager | [e.g., pnpm] | [Why this choice] |
| [Other choice] | [Decision] | [Rationale] |

## Development Environment

### Required Environment Variables

```bash
# .env.example
DATABASE_URL=postgres://localhost/[project_name]_development
[OTHER_VAR]=[value or description]
```

### IDE/Editor Setup (optional)

- [Recommended extensions or plugins]
- [Configuration files to create]

## Suggested Setup Issues

### Issue: Install [language] toolchain

**Description**: Set up the required development toolchain.

**Acceptance Criteria**:
- [ ] [Tool] is installed and accessible from command line
- [ ] Version meets minimum requirements ([version])
- [ ] Verification command succeeds

---

### Issue: Scaffold project with [framework/tool]

**Description**: Create the initial project structure.

**Acceptance Criteria**:
- [ ] Project directory created with standard structure
- [ ] Dependencies installed successfully
- [ ] Project builds/runs with no errors
- [ ] [Framework-specific checks, e.g., "default route responds"]

---

### Issue: Configure development database

**Description**: Set up local development database.

**Acceptance Criteria**:
- [ ] Database server running locally
- [ ] Development database created
- [ ] Connection string configured in environment
- [ ] Migrations run successfully (if applicable)
```

## Section Document Template

Use this structure for feature/domain section files (`docs/specs/<feature>.md`):

```markdown
# [Feature Name]

## Summary

[2-3 sentences describing what this feature area covers and its core purpose]

## Key Requirements

- [Requirement 1]: [Brief description]
- [Requirement 2]: [Brief description]
- [Requirement 3]: [Brief description]

## Ambiguities & Questions

These questions need user clarification before issues can be finalized:

1. **[Question summary]**
   - Context: [Why this matters for implementation]
   - Options considered: [If applicable]

2. **[Question summary]**
   - Context: [Why this matters]

## User Decisions

[Section populated as questions are answered]

- Q1: [Answer received]
- Q2: [Pending]

## Suggested Issues

### Issue: [Descriptive title]

**Description**: [What this issue accomplishes]

**Acceptance Criteria**:
- [ ] [Testable criterion 1]
- [ ] [Testable criterion 2]
- [ ] [Testable criterion 3]

**Dependencies**: [Other issues this depends on, if any]

---

### Issue: [Next issue title]

[Same structure]

## Notes

[Any additional context, constraints, or considerations for this feature area]
```

## Questions Document Template

Structure for `docs/specs/_questions.md`:

```markdown
# Open Questions

Last updated: [Date]
Total pending: X questions

## [Feature Area 1]

### Q1: [Question]
- **Context**: [Why this matters]
- **Status**: Pending | Answered
- **Answer**: [If answered]

### Q2: [Question]
- **Context**: [Why this matters]
- **Status**: Pending
- **Answer**: —

## [Feature Area 2]

### Q3: [Question]
...

---

## Resolved Questions

[Move answered questions here for reference]
```

## Issues Document Template

Structure for `docs/specs/_issues.md`:

```markdown
# Issues

Generated from spec on [Date]
Total issues: X (Y setup + Z feature)

## Implementation Order

Suggested sequence based on dependencies. **Setup issues must come first.**

### Phase 1: Project Setup

1. Install [language] toolchain
2. Scaffold project with [framework]
3. Configure development database
4. Set up development environment

### Phase 2: Core Features

5. [Issue title] (Feature A) - depends on setup
6. [Issue title] (Feature B) - depends on #5
7. [Issue title] (Feature A)
...

## By Category

### Setup

#### Install [language] toolchain

**Description**: Set up the required development toolchain.

**Acceptance Criteria**:
- [ ] [Tool] installed and accessible
- [ ] Version verified

**Labels**: setup, toolchain

---

#### Scaffold project

**Description**: Initialize project structure.

**Acceptance Criteria**:
- [ ] Project created with standard structure
- [ ] Builds/runs successfully

**Labels**: setup, scaffolding

---

### [Feature A]

#### [Issue Title]

**Description**: [What this accomplishes]

**Acceptance Criteria**:
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Labels**: feature-a, [priority if known]
**Depends on**: Setup issues

---

### [Feature B]

...
```

## Index Document Template

Structure for `docs/specs/index.md`:

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

**See**: [Project Setup](./_setup.md) for toolchain installation and scaffolding steps.

## Status

**Current Phase**: [Foundation | Decomposition | Analysis | Clarification | Refinement | Complete]
**Last Updated**: [Date]
**Progress**: [Brief note on what's done/pending]

## Features

| Feature | Status | Questions | Issues |
|---------|--------|-----------|--------|
| [Feature A](./feature-a.md) | Analysis complete | 2 pending | 4 drafted |
| [Feature B](./feature-b.md) | In progress | — | — |

## Documents

- [Project Setup](./_setup.md) - Toolchain, scaffolding, dev environment
- [Open Questions](./_questions.md) - X questions pending
- [Issues](./_issues.md) - Y issues defined (generated when spec is complete)

## Original Input

<details>
<summary>Click to expand original rough notes</summary>

[Paste or summarize original input here for reference]

</details>

## Notes

[Any project-wide constraints, preferences, or context that applies across all features]
```
