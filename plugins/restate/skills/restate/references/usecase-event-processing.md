---
title: "Event Processing"
sidebar_position: 3
description: "Write event processing apps with Restate"
hide_table_of_contents: true
hide_title: true
---

<div
        imgPath={"/img/use_cases/event_processing-white.svg"

## Stateful event processing with Restate

Implement stateful event handlers with Restate.

    ### !!steps K/V State and Event Enrichment
    Store persistent, consistent state directly in Restate and access it from any handler of the service. State is delivered with each request, allowing you to operate on local data without external database calls.

    [Learn more](/concepts/services#virtual-objects)

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/eventenrichment/package_tracker.ts
    CODE_LOAD::ts/src/use_cases/event_processing/event_enrichment.ts?1
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/eventenrichment/PackageTracker.java
    CODE_LOAD::java/src/main/java/usecases/eventprocessing/eventenrichment/PackageTracker.java?1
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/eventenrichment/PackageTracker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/eventprocessing/PackageTracker.kt?1
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/eventenrichment/packagetracker.go
    CODE_LOAD::go/usecases/eventprocessing/eventenrichment/packagetracker.go?1
    ```

    ```py !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases//eventenrichment/package_tracker.py
    CODE_LOAD::python/src/use_cases/event_processing/package_tracker.py?1
    ```

    ### !!steps Agents, actors and state machines

    Build event-driven agents, actors, digital twins, and state machines with Kafka integration.
    Restate provides simple concurrency guarantees while ensuring full resilience and consistency without additional infrastructure.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/eventenrichment/package_tracker.ts
    CODE_LOAD::ts/src/use_cases/event_processing/event_enrichment.ts?2
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/eventenrichment/PackageTracker.java
    CODE_LOAD::java/src/main/java/usecases/eventprocessing/eventenrichment/PackageTracker.java?2
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/eventenrichment/PackageTracker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/eventprocessing/PackageTracker.kt?2
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/eventenrichment/packagetracker.go
    CODE_LOAD::go/usecases/eventprocessing/eventenrichment/packagetracker.go?2
    ```

    ```py !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases//eventenrichment/package_tracker.py
    CODE_LOAD::python/src/use_cases/event_processing/package_tracker.py?2
    ```

    ### !!steps Combine Kafka and RPC

    Use the same functions for both Kafka events and RPC calls without code changes.
    Process events from multiple sources — registration requests via HTTP, location updates via Kafka, and queries from dashboards — all using the same handlers.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/eventenrichment/package_tracker.ts
    CODE_LOAD::ts/src/use_cases/event_processing/event_enrichment.ts?3
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/eventenrichment/PackageTracker.java
    CODE_LOAD::java/src/main/java/usecases/eventprocessing/eventenrichment/PackageTracker.java?3
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/eventenrichment/PackageTracker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/eventprocessing/PackageTracker.kt?3
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/eventenrichment/packagetracker.go
    CODE_LOAD::go/usecases/eventprocessing/eventenrichment/packagetracker.go?3
    ```

    ```py !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases//eventenrichment/package_tracker.py
    CODE_LOAD::python/src/use_cases/event_processing/package_tracker.py?3
    ```

    Restate processes events at high speed using a dedicated queue per key, pushing events to your functions for maximum parallel throughput. <br/><br/>  <a href={"https://restate.dev/blog/the-anatomy-of-a-durable-execution-stack-from-first-principles/#some-performance-numbers"Learn more</a>,
        },

            title: 'DURABLE EXECUTION',
            description: <>Restate handles all Kafka interaction complexities, guarantees exactly-once processing, and recovers event handlers to the precise point before any failure. <br/><br/>  <a href={"https://restate.dev/what-is-durable-execution/"Learn more</a>,
        },
    ]

    Understand what is happening in your event-driven apps, by using the UI, the CLI, and the built-in tracing.<br/>Debug failing executions, inspect the K/V state, and manage deployments.</p>}
        imgPath={"/img/use_cases/workflow_ui.png"}
        imgSize={"100%"}
        button1={"What can you do with UI?"}
        link1={"https://restate.dev/blog/announcing-restate-ui/"}
        button2={"What can you do with CLI?"}
        link2={"/operate/introspection/"

## What you can build with Event Processing and Restate

💡 You can connect any handler to a Kafka topic, so have a look at the other use case pages for more inspiration.

## Developer Resources
