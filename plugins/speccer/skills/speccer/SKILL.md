---
name: speccer
description: "Distill rough ideas into structured project specs with issues. This skill takes unstructured input (bullet points, rough notes, transcribed ideas) and systematically breaks it down into feature domains, identifies ambiguities requiring user clarification, and produces a single structured spec document with actionable issues. Use this skill when the user wants to transform rough project ideas into well-defined specifications and issues, or when they invoke /speccer."
user-invocable: true
---

# Speccer

Transform rough ideas into a structured project specification with actionable issues.

## Overview

This skill orchestrates a multi-phase process to distill unstructured input into a **single spec document** (`docs/spec.md`) containing:
1. Project overview and tech stack
2. Feature/domain analysis sections
3. Open questions for the user
4. Actionable issues with acceptance criteria

Everything goes in one file. Do not create multiple files or a directory of spec documents.

## Output

The entire spec is written to `docs/spec.md`. This is the only file speccer creates or modifies.

## Workflow

### Phase 0: Project Foundation

Before analyzing features, establish the project's technical foundation.

1. **Identify the tech stack** by asking the user:
   - What language/framework will this project use? (e.g., Rust, Rails, Node.js, Python)
   - Is this a new project or adding to an existing codebase?

2. **For new projects**, determine prerequisites and scaffolding:

   | Stack | Prerequisites | Scaffolding Command |
   |-------|---------------|---------------------|
   | Rust | rustup, cargo | `cargo new` or `cargo init` |
   | Rails | Ruby, bundler, rails gem | `rails new` + database choice |
   | Node.js | Node, npm/pnpm/yarn | `npm init` or framework CLI |
   | Python | Python, pip/uv, venv | `uv init` or framework setup |
   | Go | Go toolchain | `go mod init` |
   | Elixir | Erlang, Elixir, mix | `mix new` or `mix phx.new` |

3. **Ask clarifying questions** about project setup:
   - Database requirements? (PostgreSQL, SQLite, MySQL, none)
   - Package manager preferences? (npm vs pnpm, pip vs uv)
   - Any specific framework version requirements?
   - CI/CD requirements? (GitHub Actions, etc.)
   - Deployment target? (affects scaffolding choices)

### Phase 1: Decomposition

When invoked with rough input:

1. Read the input and identify distinct feature/domain areas
2. Create the initial `docs/spec.md` with the project overview, tech stack, and list of identified feature areas
3. Output a brief summary of identified features before proceeding

### Phase 2: Deep Analysis

For each identified feature/domain area, analyze:

1. What's well-defined vs ambiguous
2. Implementation concerns (without designing solutions)
3. Questions that need user clarification
4. Draft acceptance criteria for potential issues

Write each feature's analysis as a section within `docs/spec.md`. Use sub-agents (Task tool with subagent_type="general-purpose") to analyze features in parallel if needed, but have them return their analysis as text — do not have sub-agents write separate files. Incorporate their output into the single spec document yourself.

### Phase 3: User Clarification

Present questions to the user using AskUserQuestion tool:

- Group related questions where possible
- Provide context for each question
- Offer reasonable default options when applicable
- Update `docs/spec.md` with answers as they come in

For complex clarifications, ask in batches of 3-4 questions max per interaction.

### Phase 4: Refinement

After receiving user answers:

1. Update relevant sections of `docs/spec.md` with clarifications
2. Mark answered questions as resolved
3. If new questions arise from answers, repeat Phase 3

### Phase 5: Issue Generation

When all clarifications are complete:

1. Compile issues starting with setup, then feature issues
2. Add an Issues section to `docs/spec.md` with:
   - **Setup issues first**: toolchain installation, project scaffolding, initial configuration
   - Feature issues grouped by area
   - Each issue has: title, description, acceptance criteria
   - Issues are ordered by dependency (setup → foundation → features)

3. **If user wants beads integration**, for each issue:
   ```
   Use beads:create skill to create the issue with:
   - Title from spec
   - Description including acceptance criteria
   - Labels for feature area
   ```

4. Update the Status section: "Specification complete"

## Invocation

The skill can be invoked:

- `/speccer` - Start fresh with new input
- `/speccer refine` - Continue refining existing spec (re-run Phase 3-5)
- `/speccer issues` - Skip to issue generation from existing spec
- `/speccer issues --beads` - Generate issues and create beads

## Maintaining Context

When resuming work:

1. Always read `docs/spec.md` first
2. Check the Status section to determine which phase to continue
3. Look for the Open Questions section to see pending clarifications

## Tips

- Prefer more granular features over fewer large ones
- Questions should be concrete and actionable, not abstract
- Acceptance criteria should be testable/verifiable
- When uncertain about scope, err toward asking the user
