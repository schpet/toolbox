---
title: "Workflows-as-code"
sidebar_position: 1
description: "Write workflows-as-code with Restate"
hide_table_of_contents: true
hide_title: true
---

<div
        imgPath={"/img/use_cases/workflows-white.svg"

    ### Invoke idempotently and latch on
    A workflow runs exactly one time.
    Restate makes sure that duplicate requests do not lead to duplicate execution.

    If the caller loses the connection to the workflow, he can latch on again to retrieve the result.

    ```ts !!tabs TypeScript https://github.com/restatedev/examples/blob/main/typescript/patterns-use-cases/src/queue/task_submitter.ts
    CODE_LOAD::ts/src/use_cases/workflows/submit.ts
    ```
    ```java !!tabs Java https://github.com/restatedev/examples/blob/main/java/patterns-use-cases/src/main/java/my/example/queue/TaskSubmitter.java
    CODE_LOAD::java/src/main/java/usecases/workflows/WorkflowSubmitter.java
    ```
    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/workflows/WorkflowSubmitter.kt
    ```
    ```go !!tabs Go https://github.com/restatedev/examples/blob/main/go/patterns-use-cases/src/queue/client/tasksubmitter.go
    CODE_LOAD::go/usecases/workflows/client/client.go
    ```
    ```python !!tabs Python https://github.com/restatedev/examples/blob/main/python/patterns-use-cases//queue/task_submitter.py
    CODE_LOAD::python/src/use_cases/workflows/submit.py
    ```

    Restate’s event-driven foundation built in Rust lets you put workflows in the latency-sensitive path of user interaction.<br/><br/>  <a href={"https://restate.dev/blog/the-anatomy-of-a-durable-execution-stack-from-first-principles/#some-performance-numbers"Learn more</a>,
        },

            title: 'DURABLE EXECUTION',
            description: <>Restate handles retries and recovers your code to the exact point before the crash. State changes take part in durable execution, so the state never gets out of sync. <br/><br/>  <a href={"https://restate.dev/what-is-durable-execution/"Learn more</a>,
        },
    ]

## Flexible, Stateful Workflows with Restate

    ### !!steps Flexible logic and failure handling

    Restate guarantees code runs to completion. This makes it easy to implement resilient sagas in a simple try-catch block.

    Track all rollback actions in a list and run them on unrecoverable failures.

    Restate takes care of retries and recovery and makes sure all compensations run.

    [Learn more](/guides/sagas)

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/workflows/subscription_workflow.ts?2
    ```
    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/workflows/SubscriptionWorkflow.java?2
    ```
    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/workflows/SubscriptionWorkflow.kt?2
    ```
    ```go !!tabs Go
    CODE_LOAD::go/usecases/workflows/saga/subscriptionworkflow.go?2
    ```
    ```python !!tabs Python
    CODE_LOAD::python/src/use_cases/workflows/subscription_workflow.py?2
    ```

    ### !!steps Queryable workflow state

    Use Restate’s built-in key-value store to store workflow state.
    Restate guarantees that it is consistent and persistent, since state updates are tracked together with the rest of the execution progress.

    You can retrieve the current state of the workflow from within other handlers and expose it to external clients.

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/workflows/subscription_workflow.ts?1
    ```
    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/workflows/SubscriptionWorkflow.java?1
    ```
    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/workflows/SubscriptionWorkflow.kt?1
    ```
    ```go !!tabs Go
    CODE_LOAD::go/usecases/workflows/saga/subscriptionworkflow.go?1
    ```
    ```python !!tabs Python
    CODE_LOAD::python/src/use_cases/workflows/subscription_workflow.py?1
    ```

    ### !!steps Stateful, serverless workflows

    You can run stateful workflows on serverless infrastructure, like AWS Lambda.
    Restate attaches the state to the request.
    Your handlers work on local state

    [Learn more](https://restate.dev/blog/we-replaced-400-lines-of-stepfunctions-asl-with-40-lines-of-typescript-by-making-lambdas-suspendable/)

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/workflows/subscription_workflow.ts?3
    ```
    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/workflows/SubscriptionWorkflow.java?3
    ```
    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/workflows/SubscriptionWorkflow.kt?3
    ```
    ```go !!tabs Go
    CODE_LOAD::go/usecases/workflows/saga/subscriptionworkflow.go?3
    ```
    ```python !!tabs Python
    CODE_LOAD::python/src/use_cases/workflows/subscription_workflow.py?3
    ```

    Understand what is happening in your workflows, by using the UI, the CLI, and the built-in tracing.<br/>Debug failing workflows, inspect the K/V state, and manage deployments.</p>}
        imgPath={"/img/use_cases/workflow_ui.png"}
        imgSize={"100%"}
        button1={"What can you do with UI?"}
        link1={"https://restate.dev/blog/announcing-restate-ui/"}
        button2={"What can you do with CLI?"}
        link2={"/operate/introspection/"

## What you can build with Workflows and Restate

## Developer Resources

The simplest way to write workflows-as-code.</i>,
        link: {url: "https://restate.dev/blog/the-simplest-way-to-write-workflows-as-code/"}
    },

        title: 'Docs',
        description: (
            "Read the docs to learn more."
        ),
        link: {url: "/concepts/services#workflows"},
    },

        title: 'Need help?',
        description: "Join the Restate Discord or Slack communities",
        links: [
            {url: "https://discord.gg/skW3AZ6uGd", icon: "/img/discord-icon.svg"},
            {url: "https://join.slack.com/t/restatecommunity/shared_invite/zt-2v9gl005c-WBpr167o5XJZI1l7HWKImA", icon: "/img/slack.svg"}
        ]

]
