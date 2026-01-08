---
name: chores
description: Repository maintenance utilities for jujutsu (jj). This skill should be used when cleaning up a jj repository, removing empty commits, or managing commits that lack descriptions.
---

# JJ Chores

## Overview

Repository maintenance utilities for jujutsu (jj) version control. Provides workflows for cleaning up empty commits and handling commits without descriptions.

## Finding Empty Commits

To find empty mutable commits in the current branch:

```bash
jj log --ignore-working-copy --no-graph -r 'mutable() & empty() & ancestors(@)' -T 'change_id ++ " " ++ description.first_line() ++ "\n"'
```

To abandon all empty mutable commits:

```bash
jj abandon 'mutable() & empty() & ancestors(@)'
```

## Finding Commits Without Descriptions

To find mutable commits with empty descriptions:

```bash
jj log --ignore-working-copy --no-graph -r 'mutable() & ancestors(@) & description("")' -T 'change_id.short() ++ " " ++ commit_id.short() ++ "\n"'
```

To view these commits with more context:

```bash
jj log --ignore-working-copy -r 'mutable() & ancestors(@) & description("")'
```

## Auto-Describing Commits

To generate descriptions for commits using an LLM:

```bash
jj llm-describe -r <change_id>
```

This requires `jj-llm-describe` to be installed and configured.

## Revset Reference

| Revset | Description |
|--------|-------------|
| `mutable()` | All commits that are not immutable |
| `empty()` | Commits with no file changes |
| `ancestors(@)` | All ancestors of the current working copy |
| `description("")` | Commits with empty descriptions |
