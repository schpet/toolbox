---
sidebar_position: 13
description: "Invoke services from non-Restate services."
---

# Clients

The Restate SDK client library lets you invoke Restate handlers from anywhere in your application.
Use this only in non-Restate services without access to the Restate Context.

    The [UI](/develop/local_dev#restate-ui) helps you with invoking your services programmatically.
    Open the UI at port 9070, register your service, click on the service, open the playground, and copy over the code snippet to invoke your service in your preferred language.

Always [invoke handlers via the context](/develop/ts/service-communication), if you have access to it.
Restate then attaches information about the invocation to the parent invocation.

## Invoking handlers with the SDK clients

    ```shell
    npm install @restatedev/restate-sdk-clients
    ```

<a href={"/operate/registration"Register the service</a> you want to invoke.</span>

         **Request-response invocations** allow you to wait on a response from the handler.

        ```ts !result
        CODE_LOAD::ts/src/develop/clients/ingress.ts#rpc_call_node
        ```

        **One-way invocations** allow you to send a message without waiting for a response.

        ```ts !result
        CODE_LOAD::ts/src/develop/clients/ingress.ts#one_way_call_node
        ```

        **Delayed invocations** allow you to schedule an invocation for a later point in time.

        ```ts !result
        CODE_LOAD::ts/src/develop/clients/ingress.ts#delayed_call_node
        ```

[Have a look at the workflow documentation to learn what's different when invoking workflows.](/develop/ts/workflows#submitting-workflows-with-sdk-clients)

## Invoke a handler idempotently

To make a service call idempotent, you can use the idempotency key feature.
Add the idempotency key [to the header](https://datatracker.ietf.org/doc/draft-ietf-httpapi-idempotency-key-header/) via:

```typescript
CODE_LOAD::ts/src/develop/clients/ingress.ts#service_idempotent
```

After the invocation completes, Restate persists the response for a retention period of one day (24 hours).
If you re-invoke the service with the same idempotency key within 24 hours, Restate sends back the same response and doesn't re-execute the request to the service.

    By using Restate and an idempotency key, you can make any service call idempotent, without any extra code or setup.
    This is a very powerful feature to ensure that your system stays consistent and doesn't perform the same operation multiple times.

    The call options, with which we set the idempotency key, also let you add other headers to the request.

<details'
    ```
    The retention time is in [humantime format](https://docs.rs/humantime/latest/humantime/).

</details>

## Retrieve result of invocations and workflows

You can use the client library to retrieve the results of invocations **with an idempotency key** or workflows.

Attach to them by using the handle that is returned from the invocation:

```typescript
CODE_LOAD::ts/src/develop/clients/ingress.ts#service_attach
```

    [Have a look at the workflow documentation to learn how to attach to workflow executions.](/develop/ts/workflows#submitting-workflows-with-sdk-clients)
