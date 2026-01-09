# Document Templates

Templates for the spec documents created by speccer.

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
Total issues: X

## Implementation Order

Suggested sequence based on dependencies:

1. [Issue title] (Feature A)
2. [Issue title] (Feature B) - depends on #1
3. [Issue title] (Feature A)
...

## By Feature

### [Feature A]

#### [Issue Title]

**Description**: [What this accomplishes]

**Acceptance Criteria**:
- [ ] [Criterion 1]
- [ ] [Criterion 2]

**Labels**: feature-a, [priority if known]

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

## Status

**Current Phase**: [Decomposition | Analysis | Clarification | Refinement | Complete]
**Last Updated**: [Date]
**Progress**: [Brief note on what's done/pending]

## Features

| Feature | Status | Questions | Issues |
|---------|--------|-----------|--------|
| [Feature A](./feature-a.md) | Analysis complete | 2 pending | 4 drafted |
| [Feature B](./feature-b.md) | In progress | — | — |

## Documents

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
