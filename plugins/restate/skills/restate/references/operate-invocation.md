---
sidebar_position: 2
description: "Explore the different ways to invoke Restate services."
---

# Managing Invocations

An invocation is a request to execute a handler that is part of either a service, or a virtual object.
There are different ways to invoke a handler: by sending a request to Restate [over HTTP](/invoke/http), by using the [SDK clients](/invoke/clients), or [via Kafka events](/invoke/kafka).

Once an invocation is created, you can inspect it, cancel it, and kill it via its Invocation Identifier:

## Invocation identifier

Restate assigns an identifier to every invocation, the Invocation ID. You can use this Invocation ID to inspect the invocation via the CLI, filter the logs, find traces, cancel it, etc.

The invocation ID starts with `inv_`, and can be found in the [UI](/develop/local_dev#restate-ui), the logs and traces (`restate.invocation.id`).
Or you can use the CLI to list the invocations and retrieve the ID from there:

    ```shell !command
    restate invocations list
    ```

    ```shell !output
    # !focus
    ❯ [2024-04-16 15:28:20.237 +02:00] inv_1aiqX0vFEFNH0TF1pLRFBDFosQCCTAN1M5 [CartObject @ Mary]::addTicket
    Status:      backing-off  (4 minutes, 42 seconds and 653 ms. Retried 32 time(s). Next
    retry in in 9 seconds and 469 ms))
    Deployment:  dp_14LsPzGz9HBxXIeBoH5wYUh [required]
    Error:       [2024-04-16 15:33:01.930 +02:00]
    [500] Failing

    Showing 1/1 invocations. Query took 86.295361ms
    ```

## Cancelling invocations

If an invocation takes too long to complete or is no longer of interest, you can cancel it.
Canceling an invocation allows it to free any resources it is holding and roll back any changes it has made so far.

You can cancel the invocation with [its ID](/operate/invocation?interface=curl#invocation-identifier) via the [UI](/develop/local_dev#restate-ui), the CLI or [Admin API](/category/admin-api):

    ```shell !!tabs CLI
    restate invocations cancel inv_1gdJBtdVEcM942bjcDmb1c1khoaJe11Hbz
    ```
    ```shell !!tabs curl
    curl -X DELETE http://localhost:9070/invocations/inv_1gdJBtdVEcM942bjcDmb1c1khoaJe11Hbz
    ```

With the CLI, you can also cancel invocations in bulk by specifying a target string exact match or prefix of the service and handler name, for example:
- `serviceName` or `serviceName/handler`
- `virtualObjectName` or `virtualObjectName/key` or `virtualObjectName/key/handler`
- `workflowName` or `workflowName/key` or `workflowName/key/handler`

For example, to cancel all invocations of the `CartObject/add` handler:
```shell
restate invocations cancel CartObject/add
```

To roll back correctly, the handlers need to contain the necessary compensation logic.
This way, the service state stays consistent even in the presence of cancellations.
Have a look at [this guide](/guides/sagas) on how to implement compensation logic with Restate.

    Cancelling an invocation is a non-blocking operation. This means that the cancellation is not guaranteed to have completed when the API call returns. In some rare cases, cancellations will not have an effect. In these cases, users need to retry the operation.

<details
    }'
```
The options field is optional and accepts any configuration parameter from [librdkafka configuration](https://github.com/confluentinc/librdkafka/blob/master/CONFIGURATION.md).
- **List** the current subscriptions via:

    ```bash !command
    curl localhost:9070/subscriptions
    ```

    ```json !output

        "subscriptions": [

                "id": "sub_11XHoawrCiWtv8kzhEyGtsR",
                "source": "kafka://my-cluster/my-topic",
                "sink": "service://Greeter/greet",
                "options": {
                    "auto.offset.reset": "earliest",
                    "client.id": "restate",
                    "group.id": "sub_11XHoawrCiWtv8kzhEyGtsR"

        ]

    ```

The creation and listing of subscriptions returns an identifier.
- **Delete** a subscription with its identifier (starting with `sub_`) via:
```bash
curl -X DELETE localhost:9070/subscriptions/sub_11XHoawrCiWtv8kzhEyGtsR
```

    When you delete a subscription, Restate stops the consumer group associated to it. Any messages that were already enqueued by Restate will still be processed.
