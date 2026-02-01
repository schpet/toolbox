---
title: "Introspection"
sidebar_position: 7
description: "Learn how to inspect/troubleshoot stuck or failing invocations."
---

# Introspection

Restate exposes information on invocations and application state via its CLI and [Introspection SQL API](/references/sql-introspection). You can use this to gain insight into the status of invocations and the service state that is stored.

This can be useful for troubleshooting. For example, a Virtual Object might be blocked and you want to kill the invocation that is blocking it, but you don't know the invocation ID. Or you want to check what is currently stored in the state of a service.

You can inspect what is stored in Restate via the UI, via the [CLI](/develop/local_dev#running-restate-server--cli-locally) (via commands or SQL queries), and via curl.

    You can use the [UI](/develop/local_dev#restate-ui) to debug your applications.
    Have a look at the [UI announcement blog post](https://restate.dev/blog/announcing-restate-ui/) to get some inspiration on how you can use the UI for debugging and understanding your applications.

## SQL over the data in Restate

Restate exposes the following SQL tables:
- `sys_invocation`: to inspect invocations
- `sys_inbox`: to inspect queue of pending invocations
- `sys_keyed_service_status`: to inspect the status of a Virtual Object
- `sys_journal`: to inspect the invocations' journal
- `sys_service`: to inspect the registered services
- `sys_deployment`: to inspect service deployments
- `sys_idempotency`: to inspect idempotency keys
- `state`: to inspect application state

You can find the schema of each of the tables in the [references](/references/sql-introspection).

The Restate Introspection SQL API has been implemented based on [DataFusion](https://arrow.apache.org/datafusion/) and supports standard SQL syntax.

You can execute SQL queries via the CLI or over HTTP.

## Inspecting invocations

For each of the queries we will show the CLI command and the equivalent SQL query that you can execute via the CLI or over HTTP.

### Listing ongoing invocations

    ```shell !!tabs CLI
    restate invocations list
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_invocation;"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_invocation" }'
    ```

Restate only retains the entries for active invocations, workflows or invocations that were invoked with an idempotency key.
Active invocations are invocations that haven't completed yet and are either invoked or suspended.
For workflows and invocations that were invoked with an idempotency key, the entries are retained for their specified retention time.

The CLI command only shows the active invocations, not the completed ones. Use `--all` to see completed ones as well.

### Retrieving the status of an invocation

    ```shell !!tabs CLI
    restate invocations describe <INVOCATION_ID>
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_invocation where id = '<INVOCATION_ID>';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_invocation where id = '<INVOCATION_ID>';" }'
    ```

The status is either:

* `pending`: enqueued waiting for its turn
* `ready`: ready to be processed, but not yet running
* `running`: actively processing
* `backing-off`: retrying due to a failure
* `suspended`: waiting on some external input (e.g. request-response call, awakeable, sleep, ...)
* `completed`: completed (this is shown only for idempotent invocations)

### Inspecting the invocation journal

    ```shell !!tabs CLI
    restate invocations describe <INVOCATION_ID>
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_journal where id = '<INVOCATION_ID>';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_journal where id = '<INVOCATION_ID>';" }'
    ```

You see the journal printed in the output.

### Inspecting invocation retries

To have a look at the invocations that are currently in a retry loop, you can execute:

    ```shell !!tabs CLI
    restate invocations list --status backing-off
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_invocation where retry_count > 1;"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_invocation where retry_count > 1;" }'
    ```

### Listing invocations that are blocking a Virtual Object

You can retrieve the invocation ID that is currently blocking a Virtual Object via:

    ```shell !!tabs CLI
    restate invocations list --service  --key
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select invocation_id from sys_keyed_service_status where service_name = 'test.MyServiceName' and service_key = 'myKey';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select invocation_id from sys_keyed_service_status where service_name = 'test.MyServiceName' and service_key = 'myKey';" }'
    ```

With the CLI, you can also drill down and list only invocations that are blocking any Virtual Object:

```shell
restate invocations list --virtual-objects-only
```

Add `--key ` to list only invocations that are blocking a specific Virtual Object.

You can then use the invocation ID to [cancel the invocation](/operate/invocation#cancelling-invocations).

### Checking the last time an invocation was modified

    ```shell !!tabs CLI
    restate invocations describe <INVOCATION_ID>
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select modified_at from sys_invocation where id = '<INVOCATION_ID>';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select modified_at from sys_invocation where id = '<INVOCATION_ID>';" }'
    ```

This includes any modification to the invocation "data", for example when the service last switched its status from `invoked` to `suspended`, or when the last journal entry was added.

### Checking how an invocation was triggered

To find out if an invocation was triggered via the ingress or by another service:

    ```shell !!tabs CLI
    restate invocations describe <INVOCATION_ID>
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select invoked_by, invoked_by_service_name, invoked_by_id from sys_invocation where id = '<INVOCATION_ID>';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select invoked_by, invoked_by_service_name, invoked_by_id from sys_invocation where id = '<INVOCATION_ID>';" }'
    ```

With the CLI, you see the caller at the root of the tree in the invocation progress:

```shell
🚂 Invocation Progress:
―――――――――――――――――――――――
[Ingress]
└──(this)─> Greeter/greet
```

For the SQL queries, the `invoked_by` field contains either `ingress` or `service`.
If the invocation was triggered by another service, then the fields `invoked_by_service_name` and `invoked_by_id` will supply more information about the invoking service.

### Retrieving the trace ID of an invocation

    ```shell !!tabs CLI
    restate invocations describe <INVOCATION_ID>
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select trace_id from sys_invocation where id = '<INVOCATION_ID>';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select trace_id from sys_invocation where id = '<INVOCATION_ID>';" }'
    ```

Afterwards, you can use this trace ID to [search for spans in Jaeger](/operate/monitoring/tracing#searching-traces).

### Listing inactive invocations

To list the oldest invocations that are not making progress:

    ```shell !!tabs CLI
    restate invocations list --oldest-first --status pending,backing-off,suspended
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_invocation where to_timestamp(modified_at) <= now() - interval '1' hour;"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_invocation where to_timestamp(modified_at) <= now() - interval '1' hour;" }'
    ```

### Listing zombie invocations

Zombie invocations are invocations that are pinned to a specific deployment but that deployment was forcefully removed. You can list them by executing:

    ```shell !!tabs CLI
    restate invocations list --zombie
    ```
    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_invocation where pinned_deployment_id = '<DEPLOYMENT_ID>';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_invocation where pinned_deployment_id = '<DEPLOYMENT_ID>';" }'
    ```

For the SQL queries, you need to know the deployment ID of the deployment that was forcefully removed.

## Inspecting application state

### With the CLI
To retrieve the state of a specific service and service key, do:

    ```shell !command
    restate kv get <SERVICE_NAME> <SERVICE_KEY>
    ```

    ```log !output
    🤖 State:
    ―――――――――

    service  counter
    key      bob

    KEY   VAL
    seen  8
    ```

If the values are not JSON-encoded UTF-8 strings, then it is also possible to use the `--binary` flag,
and get the value as base64 encoded string.

### With SQL queries

You can query the application state via the `state` table.

    ```shell !!tabs CLI-SQL
    restate sql --json "select * from state where service_name = 'test.MyServiceName' and service_key = 'myKey';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from state where service_name = 'test.MyServiceName' and service_key = 'myKey';" }'
    ```

If your state value is a regular string, then you can access its content in the column `value_utf8`.

To retrieve the state of a specific service name, service key and state key, do:

    ```shell !!tabs CLI-SQL
    restate sql --json "select * from state where service_name = 'MyServiceName' and service_key = 'myKey' and key = 'myStateKey';"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from state where service_name = 'MyServiceName' and service_key = 'myKey' and key = 'myStateKey';" }'
    ```

The state key is the name you used to store the state with the SDK. For example, the code snippet `ctx.set("count", 1)` stores `1` under the key `count`.

To join the `sys_invocation` and `state` table:

    ```shell !!tabs CLI-SQL
    restate sql --json "select * from sys_invocation JOIN state on sys_invocation.target_service_name = state.service_name and sys_invocation.target_service_key = state.service_key;"
    ```
    ```shell !!tabs curl
    curl localhost:9070/query --json '{ "query" : "select * from sys_invocation JOIN state on sys_invocation.target_service_name = state.service_name and sys_invocation.target_service_key = state.service_key;" }'
    ```

## Edit application state

You can edit the application state either via the state tab of the UI or via the CLI:

```shell
restate kv edit <SERVICE_NAME> <SERVICE_KEY>
```

This command opens your default editor (as configured in the `cli env`).
It sends the new state values back to the runtime to be applied.

Use `--binary` if the values are not JSON-encoded UTF-8 strings.
In this case, you need to decode the base64-encoded string, and encode it back to base64 after editing.

Use `--plain` to retrieve the state as a JSON object.
This can be useful in combination with tools like `jq` for example:

```shell
restate kv get counter bob --plain | jq '.seen'
```

If during the editing of the state with the CLI, an invocation changed the state as well, then the edit of the CLI will not take affect.
If you want the CLI state edit to be applied even if the state has changed in the meantime, then use the `--force` flag.

An example on how to edit the K/V state of the service `counter` for the key `bob`:

    ```shell !command
    restate kv edit counter bob
    ```

    ```log !output
    ℹ️  About to write the following state :
    ―――――――――――――――――――――――――――――――――――――――

    service  counter
    key      bob
    force?   false
    binary?  false

    KEY   VAL
    seen  8

    ✔ Are you sure? · yes

    Enqueued successfully for processing
    ```
