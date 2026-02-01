---
title: "Microservice Orchestration"
sidebar_position: 2
description: "Write resilient microservices with Restate"
hide_table_of_contents: true
hide_title: true
---

<div
        imgPath={"/img/use_cases/microservice_orchestration-white.svg"

## Sagas and Distributed Transactions
Restate guarantees code runs to completion, enabling you to implement resilient [sagas](https://www.baeldung.com/cs/saga-pattern-microservices) in a try-catch block.
Restate handles retries and recovery.

    ### !!steps Track compensations

    With durable code execution, sagas can be expressed purely in code. As functions execute, undo operations are tracked in a list.

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/microservices/subscription_saga.ts?1
    ```

    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/microservices/SubscriptionSaga.java?1
    ```

    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/microservices/saga/SubscriptionSaga.kt?1
    ```

    ```go !!tabs Go
    CODE_LOAD::go/usecases/microservices/saga/subscriptionsaga.go?1
    ```

    ```py !!tabs Python
    CODE_LOAD::python/src/use_cases/microservices/subscription_saga.py?1
    ```

    ### !!steps Guaranteed roll back

    When an unrecoverable error occurs, previously completed changes are rolled back. Restate ensures all compensation actions run to completion.

    [Learn more](/guides/sagas)

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/microservices/subscription_saga.ts?2
    ```

    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/microservices/SubscriptionSaga.java?2
    ```

    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/microservices/saga/SubscriptionSaga.kt?2
    ```

    ```go !!tabs Go
    CODE_LOAD::go/usecases/microservices/saga/subscriptionsaga.go?2
    ```

    ```py !!tabs Python
    CODE_LOAD::python/src/use_cases/microservices/subscription_saga.py?2
    ```

## Stateful Entities and State Machines
Restate lets you implement stateful services by storing state directly in Restate.

    ### !!steps Consistent state

    Implement state machines where state transitions are always consistent with your code.

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/microservices/subscription_object.ts?1
    ```

    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/microservices/SubscriptionObject.java?1
    ```

    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/microservices/vo/SubscriptionObject.kt?1
    ```

    ```go !!tabs Go
    CODE_LOAD::go/usecases/microservices/vo/subscriptionobject.go?1
    ```

    ```py !!tabs Python
    CODE_LOAD::python/src/use_cases/microservices/subscription_object.py?1
    ```

    ### !!steps Scalability, concurrency, consistency

    Restate guards consistency by ensuring only one handler writes to a single state value at a time.
    Scale out without worrying about multiple writers, lost updates, race conditions, or inconsistencies.

    [Learn more](/concepts/services#virtual-objects)

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/microservices/subscription_object.ts?2
    ```

    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/microservices/SubscriptionObject.java?2
    ```

    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/microservices/vo/SubscriptionObject.kt?2
    ```

    ```go !!tabs Go
    CODE_LOAD::go/usecases/microservices/vo/subscriptionobject.go?2
    ```

    ```py !!tabs Python
    CODE_LOAD::python/src/use_cases/microservices/subscription_object.py?2
    ```

    ### !!steps Stateful serverless

    Run stateful services on serverless infrastructure. Restate attaches the service's K/V state to each request, allowing your handlers to work with local state.

    [Learn more](https://restate.dev/blog/we-replaced-400-lines-of-stepfunctions-asl-with-40-lines-of-typescript-by-making-lambdas-suspendable/ )

    ```ts !!tabs TypeScript
    CODE_LOAD::ts/src/use_cases/microservices/subscription_object.ts?3
    ```

    ```java !!tabs Java
    CODE_LOAD::java/src/main/java/usecases/microservices/SubscriptionObject.java?3
    ```

    ```kotlin !!tabs Kotlin
    CODE_LOAD::kotlin/src/main/kotlin/usecases/microservices/vo/SubscriptionObject.kt?3
    ```

    ```go !!tabs Go
    CODE_LOAD::go/usecases/microservices/vo/subscriptionobject.go?3
    ```

    ```py !!tabs Python
    CODE_LOAD::python/src/use_cases/microservices/subscription_object.py?3
    ```

    Restate tracks communication and execution, giving it a unique position for observability.<br/>
            Understand what is happening in your distributed applications, by using the UI, the CLI, and the built-in tracing.</p>}
        imgPath={"/img/use_cases/microservice_observability.svg"}
        imgSize={"100%"}
        button1={"What can you do with UI?"}
        link1={"https://restate.dev/blog/announcing-restate-ui/"}
        button2={"What can you do with CLI?"}
        link2={"/operate/introspection/"

## What you can build with Microservice Orchestration and Restate

## Developer Resources

Why we built Restate</i>,
        link: {url: "https://restate.dev/blog/why-we-built-restate/"}
    },

        title: 'Learn',
        description: (
            "Follow the Tour of Restate to learn more."
        ),
        link: {url: "/get_started/tour"}
    },

        title: 'Need help?',
        description: "Join the Restate Discord or Slack communities",
        links: [
            {url: "https://discord.gg/skW3AZ6uGd", icon: "/img/discord-icon.svg"},
            {url: "https://join.slack.com/t/restatecommunity/shared_invite/zt-2v9gl005c-WBpr167o5XJZI1l7HWKImA", icon: "/img/slack.svg"}
        ]

]
