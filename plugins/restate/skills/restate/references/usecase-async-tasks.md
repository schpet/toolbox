---
title: "Async tasks"
sidebar_position: 4
description: "Schedule async tasks and let Restate manage their execution."
hide_table_of_contents: true
hide_title: true
---

<div
        imgPath={"/img/use_cases/workflows-white.svg"

## Parallelizing work with Restate

    ### !!steps Fan out

    Write flexible scheduling logic with Restate's durable building blocks.
    Fan out tasks with resilient RPC calls.
    Restate makes sure all tasks run to completion, with retries and recovery upon failures.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/parallelizework/fan_out_worker.ts
    CODE_LOAD::ts/src/use_cases/async_tasks/fan_out_worker.ts?1
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/parallelizework/FanOutWorker.java
    CODE_LOAD::java/src/main/java/usecases/asynctasks/parallelize/FanOutWorker.java?1
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/parallelizework/FanOutWorker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/asynctasks/FanOutWorker.kt?1
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/parallelizework/fanoutworker.go
    CODE_LOAD::go/usecases/asynctasks/parallelizework/fanoutworker.go?1
    ```

    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases/parallelizework/app.py
    CODE_LOAD::python/src/use_cases/async_tasks/fan_out_worker.py?1
    ```

    ### !!steps Fan in
    Invocations produce durable promises that can be awaited and combined.
    These durable promises can be recovered on other processes after a failure.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/parallelizework/fan_out_worker.ts
    CODE_LOAD::ts/src/use_cases/async_tasks/fan_out_worker.ts?2
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/parallelizework/FanOutWorker.java
    CODE_LOAD::java/src/main/java/usecases/asynctasks/parallelize/FanOutWorker.java?2
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/parallelizework/FanOutWorker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/asynctasks/FanOutWorker.kt?2
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/parallelizework/fanoutworker.go
    CODE_LOAD::go/usecases/asynctasks/parallelizework/fanoutworker.go?2
    ```

    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases/parallelizework/app.py
    CODE_LOAD::python/src/use_cases/async_tasks/fan_out_worker.py?2
    ```

    ### !!steps Server(less)
    Deploy this service or its subtask processors on a platform like Kubernetes or AWS Lambda to
    automatically get parallel scale out.

    [Learn more](https://restate.dev/blog/we-replaced-400-lines-of-stepfunctions-asl-with-40-lines-of-typescript-by-making-lambdas-suspendable/)

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/parallelizework/fan_out_worker.ts
    CODE_LOAD::ts/src/use_cases/async_tasks/fan_out_worker.ts?3
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/parallelizework/FanOutWorker.java
    CODE_LOAD::java/src/main/java/usecases/asynctasks/parallelize/FanOutWorker.java?3
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/parallelizework/FanOutWorker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/asynctasks/FanOutWorker.kt?3
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/parallelizework/fanoutworker.go
    CODE_LOAD::go/usecases/asynctasks/parallelizework/fanoutworker.go?3
    ```

    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases/parallelizework/app.py
    CODE_LOAD::python/src/use_cases/async_tasks/fan_out_worker.py?3
    ```

    Restate’s event-driven foundation built in Rust lets you queue events. Restate pushes them to your functions at high speed.<br/><br/>  <a href={"https://restate.dev/blog/the-anatomy-of-a-durable-execution-stack-from-first-principles/#some-performance-numbers"Learn more</a>,
        },

            title: 'DURABLE EXECUTION',
            description: <>Restate guarantees all tasks run to completion. It keeps track of timers, handles retries and recovery upon failures, and ensures that tasks are executed exactly once. <br/><br/>  <a href={"https://restate.dev/what-is-durable-execution/"Learn more</a>,
        },
    ]

## Durable webhook processing with Restate

    ### !!steps Restate handlers as durable event processors
    Point your webhook endpoint to any Restate handler.
    Restate makes sure all events are persisted and run to completion.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/schedulingtasks/payment_reminders.ts
    CODE_LOAD::ts/src/use_cases/async_tasks/reminders/payment_reminders.ts?1
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/schedulingtasks/PaymentTracker.java
    CODE_LOAD::java/src/main/java/usecases/asynctasks/reminder/PaymentTracker.java?1
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/schedulingtasks/PaymentTracker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/asynctasks/reminder/PaymentTracker.kt?1
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/schedulingtasks/paymentreminders.go
    CODE_LOAD::go/usecases/asynctasks/reminder/paymenttracker.go?1
    ```

    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases/schedulingtasks/app.py
    CODE_LOAD::python/src/use_cases/async_tasks/reminders/payment_tracker.py?1
    ```

    ### !!steps
    Schedule follow-up tasks for webhook events, like reminders or escalations.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/schedulingtasks/payment_reminders.ts
    CODE_LOAD::ts/src/use_cases/async_tasks/reminders/payment_reminders.ts?2
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/schedulingtasks/PaymentTracker.java
    CODE_LOAD::java/src/main/java/usecases/asynctasks/reminder/PaymentTracker.java?2
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/schedulingtasks/PaymentTracker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/asynctasks/reminder/PaymentTracker.kt?2
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/schedulingtasks/paymentreminders.go
    CODE_LOAD::go/usecases/asynctasks/reminder/paymenttracker.go?2
    ```

    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases/schedulingtasks/app.py
    CODE_LOAD::python/src/use_cases/async_tasks/reminders/payment_tracker.py?2
    ```

    ### !!steps Stateful handlers and event joins

    Correlate or join asynchronous events by routing them to the same object.

    Restate ensures sequential processing of events for the same key while giving access to durable key-value state.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/schedulingtasks/payment_reminders.ts
    CODE_LOAD::ts/src/use_cases/async_tasks/reminders/payment_reminders.ts?3
    ```

    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/schedulingtasks/PaymentTracker.java
    CODE_LOAD::java/src/main/java/usecases/asynctasks/reminder/PaymentTracker.java?3
    ```

    ```kotlin !!tabs Kotlin https://github.com/restatedev/examples/blob/main/kotlin/patterns-use-cases/src/main/kotlin/my/example/schedulingtasks/PaymentTracker.kt
    CODE_LOAD::kotlin/src/main/kotlin/usecases/asynctasks/reminder/PaymentTracker.kt?3
    ```

    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/schedulingtasks/paymentreminders.go
    CODE_LOAD::go/usecases/asynctasks/reminder/paymenttracker.go?3
    ```

    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases/schedulingtasks/app.py
    CODE_LOAD::python/src/use_cases/async_tasks/reminders/payment_tracker.py?3
    ```

## What you can build with Async Tasks and Restate

    💡 You can invoke any handler asynchronously, so have a look at the other use case pages for more inspiration.

## Developer Resources
