---
name: speccer
description: "Distill rough ideas into structured project specs with issues. This skill takes unstructured input (bullet points, rough notes, transcribed ideas) and systematically breaks it down into feature domains, uses sub-agents to deeply analyze each domain, identifies ambiguities requiring user clarification, and ultimately produces a structured spec with actionable issues. Use this skill when the user wants to transform rough project ideas into well-defined specifications and issues, or when they invoke /speccer."
user-invocable: true
---

# Speccer

Transform rough ideas into structured project specifications with actionable issues.

## Overview

This skill orchestrates a multi-phase process to distill unstructured input into:
1. A top-level project overview document
2. Feature/domain section documents
3. A consolidated list of questions for the user
4. Actionable issues with acceptance criteria

All spec documents live in `docs/specs/` within the project.

## Document Structure

```
docs/specs/
├── index.md           # Top-level overview, links to all sections
├── _questions.md      # Consolidated questions awaiting user answers
├── _issues.md         # Generated issues with acceptance criteria
└── {feature}.md       # One file per feature/domain area
```

## Workflow

### Phase 1: Decomposition

When invoked with rough input:

1. Read the input and identify distinct feature/domain areas
2. Create `docs/specs/` directory if it doesn't exist
3. Create initial `docs/specs/index.md` with:
   - Project name/title (ask user if unclear)
   - High-level summary of what the project does
   - List of identified feature areas (as links to section files)
   - Status: "Decomposition complete, analysis in progress"

Output a brief summary of identified features before proceeding.

### Phase 2: Deep Analysis (Sub-Agents)

For each identified feature/domain area, spawn a sub-agent using the Task tool:

```
Use Task tool with subagent_type="general-purpose" for each feature:

Prompt template:
"Analyze the following feature area for a project spec. Your task is to:

1. Read the rough input related to this feature
2. Identify what's well-defined vs ambiguous
3. Consider implementation concerns (but don't design solutions)
4. List questions that need user clarification
5. Draft acceptance criteria for potential issues

Feature: {feature_name}
Context: {relevant_input_excerpt}
Project overview: {brief_project_context}

Output a structured analysis with:
- Summary (2-3 sentences)
- Key requirements (bullet points)
- Ambiguities/Questions (numbered list with context for why it matters)
- Suggested issues (title + draft acceptance criteria)

Write your analysis to: docs/specs/{feature_slug}.md"
```

Run sub-agents in parallel where possible (multiple Task tool calls in one message).

### Phase 3: Consolidation

After all sub-agents complete:

1. Read all generated section files in `docs/specs/`
2. Extract all questions/ambiguities from each section
3. Create `docs/specs/_questions.md` with:
   - Questions grouped by feature area
   - Each question includes context for why it matters
   - Numbered for easy reference
4. Update `docs/specs/index.md`:
   - Add links to all section files
   - Update status: "Analysis complete, awaiting clarification"

### Phase 4: User Clarification

Present questions to the user using AskUserQuestion tool:

- Group related questions where possible
- Provide context for each question
- Offer reasonable default options when applicable
- Mark questions as answered in `_questions.md` as responses come in

For complex clarifications, ask in batches of 3-4 questions max per interaction.

### Phase 5: Refinement

After receiving user answers:

1. Update relevant section files with clarifications
2. Mark answered questions in `_questions.md` as resolved
3. If new questions arise from answers, add them and repeat Phase 4
4. Update `index.md` status when all questions resolved

### Phase 6: Issue Generation

When all clarifications are complete:

1. Read all section files
2. Compile issues from each section's "Suggested issues"
3. Create `docs/specs/_issues.md` with:
   - Issues grouped by feature area
   - Each issue has: title, description, acceptance criteria
   - Issues are ordered by suggested implementation sequence

4. **If user wants beads integration**, for each issue:
   ```
   Use beads:create skill to create the issue with:
   - Title from spec
   - Description including acceptance criteria
   - Labels for feature area
   ```

5. Update `index.md`:
   - Status: "Specification complete"
   - Link to `_issues.md`
   - Summary of total issues generated

## Invocation

The skill can be invoked:

- `/speccer` - Start fresh with new input
- `/speccer refine` - Continue refining existing spec (re-run Phase 4-6)
- `/speccer issues` - Skip to issue generation from existing spec
- `/speccer issues --beads` - Generate issues and create beads

## Maintaining Context

The `index.md` file serves as the authoritative reference. When resuming work:

1. Always read `docs/specs/index.md` first
2. Check status to determine which phase to continue
3. Read `_questions.md` to see pending clarifications
4. Sub-agents should be given relevant section context

## Example Index Structure

```markdown
# Project: [Name]

## Overview
[2-3 sentence summary]

## Status
[Current phase and progress]

## Features

- [Feature A](./feature-a.md) - Brief description
- [Feature B](./feature-b.md) - Brief description
- [Feature C](./feature-c.md) - Brief description

## Documents

- [Open Questions](./_questions.md) - X questions pending
- [Issues](./_issues.md) - Y issues defined

## Notes
[Any project-wide context or constraints]
```

## Tips

- Prefer more granular features over fewer large ones
- Questions should be concrete and actionable, not abstract
- Acceptance criteria should be testable/verifiable
- Keep section files focused; split if they grow beyond ~500 lines
- When uncertain about scope, err toward asking the user
