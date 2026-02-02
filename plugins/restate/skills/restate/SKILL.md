---
name: restate
description: "This skill should be used when working with Restate durable execution framework, building workflows, virtual objects, or services that need automatic retries, state management, and fault tolerance. Use when the user mentions \"restate\", \"durable execution\", \"durable workflows\", needs to build resilient distributed systems, or when they invoke /restate."
user-invocable: true
---

# Restate Durable Execution Framework

Restate is a durable execution framework that makes applications resilient to failures. Use this skill when building:

- Durable workflows with automatic retries
- Services with persisted state (Virtual Objects)
- Microservice orchestration with transactional guarantees
- Event processing with exactly-once semantics
- Long-running tasks that survive crashes

## When to Use Restate

Use Restate when:
- Building workflows that must complete despite failures
- Need automatic retry and recovery without manual retry logic
- Building stateful services (shopping carts, user sessions, payment processing)
- Orchestrating multiple services with saga/compensation patterns
- Processing events with exactly-once delivery guarantees
- Scheduling durable timers and cron jobs

## Core Concepts

### Service Types

Restate supports three service types:

1. **Services** - Stateless handlers with durable execution
   - Use for: microservice orchestration, sagas, idempotent requests

2. **Virtual Objects** - Stateful handlers with K/V state isolated per key
   - Use for: entities (shopping cart), state machines, actors, stateful event processing
   - Only one handler runs at a time per object key (consistency guarantee)

3. **Workflows** - Special Virtual Objects where `run` handler executes exactly once
   - Use for: order processing, human-in-the-loop, long-running provisioning

See [Services Concepts](./references/concepts-services.md) for detailed comparison.

### Durable Building Blocks

Restate provides these building blocks through the SDK context:

- **Journaled actions** (`ctx.run()`) - Persist results of side effects
- **State** (`ctx.get/set/clear`) - K/V state for Virtual Objects
- **Timers** (`ctx.sleep()`) - Durable sleep that survives restarts
- **Service calls** (`ctx.serviceClient()`) - RPC with automatic retries
- **Awakeables** - Wait for external events/signals

See [Durable Building Blocks](./references/concepts-durable-building-blocks.md).

## TypeScript SDK Quick Reference

### Installation

```bash
npm install @restatedev/restate-sdk
```

### Basic Service

```typescript
import * as restate from "@restatedev/restate-sdk";

const myService = restate.service({
  name: "MyService",
  handlers: {
    greet: async (ctx: restate.Context, name: string) => {
      return "Hello, " + name + "!";
    },
  },
});

restate.endpoint().bind(myService).listen(9080);
```

### Virtual Object (Stateful)

```typescript
const counter = restate.object({
  name: "Counter",
  handlers: {
    add: async (ctx: restate.ObjectContext, value: number) => {
      const current = (await ctx.get<number>("count")) ?? 0;
      ctx.set("count", current + value);
      return current + value;
    },
    get: restate.handlers.object.shared(
      async (ctx: restate.ObjectSharedContext) => {
        return (await ctx.get<number>("count")) ?? 0;
      }
    ),
  },
});
```

### Workflow

```typescript
const paymentWorkflow = restate.workflow({
  name: "PaymentWorkflow",
  handlers: {
    run: async (ctx: restate.WorkflowContext, payment: Payment) => {
      // Step 1: Reserve funds
      const reservation = await ctx.run("reserve", () =>
        reserveFunds(payment)
      );

      // Step 2: Wait for approval (awakeable)
      const approved = await ctx.promise<boolean>("approval");
      if (!approved) {
        await ctx.run("cancel", () => cancelReservation(reservation));
        return { status: "cancelled" };
      }

      // Step 3: Complete payment
      await ctx.run("complete", () => completePayment(reservation));
      return { status: "completed" };
    },

    approve: async (ctx: restate.WorkflowSharedContext) => {
      ctx.promise<boolean>("approval").resolve(true);
    },

    reject: async (ctx: restate.WorkflowSharedContext) => {
      ctx.promise<boolean>("approval").resolve(false);
    },
  },
});
```

### Key SDK Patterns

```typescript
// Journaled action - result persisted, replayed on retry
const result = await ctx.run("action-name", async () => {
  return await callExternalApi();
});

// Durable timer - survives restarts
await ctx.sleep(60_000); // 60 seconds

// Call another service
const client = ctx.serviceClient(OtherService);
const response = await client.handler(input);

// Async call (fire and forget)
ctx.serviceSendClient(OtherService).handler(input);

// Delayed call
ctx.serviceSendClient(OtherService, { delay: 60_000 }).handler(input);

// Awakeable - wait for external signal
const { id, promise } = ctx.awakeable<string>();
// Give `id` to external system, then:
const result = await promise;

// Random (deterministic)
const value = ctx.rand.random();
const uuid = ctx.rand.uuidv4();
```

## Running Locally

1. Start Restate server:
```bash
npx @restatedev/restate-server
```

2. Run your service:
```bash
npx ts-node src/app.ts
```

3. Register service with Restate:
```bash
npx @restatedev/restate deployments register http://localhost:9080
```

4. Invoke handlers via HTTP:
```bash
# Service handler
curl localhost:8080/MyService/greet -H 'content-type: application/json' -d '"World"'

# Virtual Object handler (with key)
curl localhost:8080/Counter/user123/add -H 'content-type: application/json' -d '5'

# Start workflow
curl localhost:8080/PaymentWorkflow/order-456/run -H 'content-type: application/json' -d '{"amount": 100}'
```

## Documentation References

### Concepts
- [Services](./references/concepts-services.md) - Service types and use cases
- [Invocations](./references/concepts-invocations.md) - How invocations work
- [Durable Execution](./references/concepts-durable-execution.md) - Execution guarantees
- [Durable Building Blocks](./references/concepts-durable-building-blocks.md) - SDK primitives

### TypeScript SDK
- [Overview](./references/ts-overview.md) - SDK setup and service definitions
- [State](./references/ts-state.md) - K/V state management
- [Journaling Results](./references/ts-journaling-results.md) - Side effects and `ctx.run()`
- [Durable Timers](./references/ts-durable-timers.md) - Sleep and scheduling
- [Service Communication](./references/ts-service-communication.md) - Calling other services
- [Awakeables](./references/ts-awakeables.md) - External events
- [Workflows](./references/ts-workflows.md) - Workflow implementation
- [Error Handling](./references/ts-error-handling.md) - Error patterns
- [Serving](./references/ts-serving.md) - Running services
- [Testing](./references/ts-testing.md) - Testing strategies
- [Clients](./references/ts-clients.md) - Client SDK

### Guides
- [Error Handling](./references/guide-error-handling.md) - Comprehensive error handling
- [Sagas](./references/guide-sagas.md) - Saga pattern with compensations
- [Cron Jobs](./references/guide-cron.md) - Scheduled tasks
- [Parallelizing Work](./references/guide-parallelizing-work.md) - Fan-out patterns
- [Databases](./references/guide-databases.md) - Database integration
- [Lambda Deployment](./references/guide-lambda-ts.md) - AWS Lambda deployment

### Use Cases
- [Workflows](./references/usecase-workflows.md)
- [Async Tasks](./references/usecase-async-tasks.md)
- [Event Processing](./references/usecase-event-processing.md)
- [Microservice Orchestration](./references/usecase-microservice-orchestration.md)

### Operations
- [HTTP Invocation](./references/invoke-http.md)
- [Service Registration](./references/operate-registration.md)
- [Versioning](./references/operate-versioning.md)
- [Architecture](./references/architecture.md)

## Important Guidelines

1. **Side effects must be wrapped in `ctx.run()`** - External calls, random values, timestamps must go through the context to be journaled and replayed correctly.

2. **State access only in Virtual Objects/Workflows** - Plain Services don't have state access.

3. **Handlers must be deterministic** - Same inputs should produce same outputs. Use `ctx.rand` for randomness.

4. **One handler per Virtual Object key at a time** - Restate ensures consistency by queuing concurrent requests to the same key.

5. **Workflows `run` handler executes exactly once** - Use other handlers to query/signal the workflow.

6. **Register services after code changes** - Run `restate deployments register` to update handler definitions.

---
*Generated from Restate documentation. Run `scripts/sync-docs.sh` to update.*

## License

The content in the `references/` directory is derived from the [Restate documentation](https://github.com/restatedev/documentation) and [TypeScript SDK](https://github.com/restatedev/sdk-typescript).
