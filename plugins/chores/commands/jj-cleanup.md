---
description: Clean up jj repository by removing empty commits and handling commits without descriptions
---

# JJ Cleanup

Perform repository maintenance tasks for jujutsu (jj) repositories.

## Workflow

### Step 1: Remove Empty Mutable Commits

First, find all empty mutable commits in the current branch and remove them:

1. Run this command to find empty mutable commits:
   ```bash
   jj log --ignore-working-copy --no-graph -r 'mutable() & empty() & ancestors(@)' -T 'change_id ++ " " ++ description.first_line() ++ "\n"'
   ```

2. If any empty commits are found, abandon them using:
   ```bash
   jj abandon 'mutable() & empty() & ancestors(@)'
   ```

3. Report to the user how many empty commits were removed.

### Step 2: Handle Commits Without Descriptions

Next, find mutable commits without descriptions:

1. Run this command to find commits with empty descriptions:
   ```bash
   jj log --ignore-working-copy --no-graph -r 'mutable() & ancestors(@) & description("")' -T 'change_id.short() ++ " " ++ commit_id.short() ++ "\n"'
   ```

2. If any commits without descriptions are found, show them to the user with:
   ```bash
   jj log --ignore-working-copy -r 'mutable() & ancestors(@) & description("")'
   ```

3. Use the AskUserQuestion tool to ask what to do with these commits. Present these options:

   **Option 1: Auto-describe** - Run `jj llm-describe` on each commit to generate descriptions using an LLM

   **Option 2: Do nothing** - Leave the commits as they are

   **Option 3: User explains** - Let the user provide their own descriptions or instructions

4. Based on the user's choice:
   - If "Auto-describe": For each commit, run `jj llm-describe -r <change_id>`
   - If "Do nothing": Skip and report completion
   - If "User explains": Wait for user input and follow their instructions

## Notes

- The `mutable()` revset ensures only non-immutable commits are affected
- The `ancestors(@)` constraint limits changes to the current branch
- Always use `--ignore-working-copy` for read operations to avoid unnecessary snapshots
