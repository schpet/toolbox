# restate

Restate durable execution framework documentation and patterns for Claude Code.

## Installation

Add the marketplace:

```bash
claude plugin marketplace add schpet/toolbox
```

Install the plugin:

```bash
claude plugin install restate@toolbox
```

Restart Claude Code after installation.

## Usage

```bash
claude "use the restate skill to build a durable workflow"
```

Or invoke the skill directly:

```
/restate
```

## What is Restate?

[Restate](https://restate.dev) is a durable execution framework that makes applications resilient to failures. This plugin provides guidance for:

- Durable workflows with automatic retries
- Services with persisted state (Virtual Objects)
- Microservice orchestration with transactional guarantees
- Event processing with exactly-once semantics
- Long-running tasks that survive crashes
