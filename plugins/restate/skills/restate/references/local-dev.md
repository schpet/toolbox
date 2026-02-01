---
sidebar_position: 2
slug: "/develop/local_dev"
description: "Learn how to set up your local dev environment"
---

# Installation

## Running Restate Server & CLI locally
Restate is a single self-contained binary. No external dependencies needed.

            Install Restate Server and CLI via:

            ```shell !result
            brew install restatedev/tap/restate-server restatedev/tap/restate
            ```

            Then run the Restate Server with:
            ```shell !result
            restate-server
            ```

        Install the Restate Server and CLI by downloading the binaries with `curl` from the [releases page](https://github.com/restatedev/restate/releases/latest), and make them executable:

            ```shell !!tabs Linux-x64
            BIN=$HOME/.local/bin && RESTATE_PLATFORM=x86_64-unknown-linux-musl && \
            curl -L --remote-name-all https://restate.gateway.scarf.sh/latest/restate-{server,cli}-$RESTATE_PLATFORM.tar.xz && \
            tar -xvf restate-server-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-server-$RESTATE_PLATFORM/restate-server && \
            tar -xvf restate-cli-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-cli-$RESTATE_PLATFORM/restate && \
            chmod +x restate restate-server && \

            # Move the binaries to a directory in your PATH, for example ~/.local/bin:
            mv restate $BIN && \
            mv restate-server $BIN
            ```

            ```shell !!tabs Linux-arm64
            BIN=$HOME/.local/bin && RESTATE_PLATFORM=aarch64-unknown-linux-musl && \
            curl -L --remote-name-all https://restate.gateway.scarf.sh/latest/restate-{server,cli}-$RESTATE_PLATFORM.tar.xz && \
            tar -xvf restate-server-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-server-$RESTATE_PLATFORM/restate-server && \
            tar -xvf restate-cli-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-cli-$RESTATE_PLATFORM/restate && \
            chmod +x restate restate-server && \

            # Move the binaries to a directory in your PATH, for example ~/.local/bin:
            mv restate $BIN && \
            mv restate-server $BIN
            ```

            ```shell !!tabs MacOS-x64
            BIN=/usr/local/bin && RESTATE_PLATFORM=x86_64-apple-darwin && \
            curl -L --remote-name-all https://restate.gateway.scarf.sh/latest/restate-{server,cli}-$RESTATE_PLATFORM.tar.xz && \
            tar -xvf restate-server-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-server-$RESTATE_PLATFORM/restate-server && \
            tar -xvf restate-cli-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-cli-$RESTATE_PLATFORM/restate && \
            chmod +x restate restate-server && \

            # Move the binaries to a directory in your PATH, for example /usr/local/bin (needs sudo):
            sudo mv restate $BIN && \
            sudo mv restate-server $BIN
            ```

            ```shell !!tabs MacOS-arm64
            BIN=/usr/local/bin && RESTATE_PLATFORM=aarch64-apple-darwin && \
            curl -L --remote-name-all https://restate.gateway.scarf.sh/latest/restate-{server,cli}-$RESTATE_PLATFORM.tar.xz && \
            tar -xvf restate-server-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-server-$RESTATE_PLATFORM/restate-server && \
            tar -xvf restate-cli-$RESTATE_PLATFORM.tar.xz --strip-components=1 restate-cli-$RESTATE_PLATFORM/restate && \
            chmod +x restate restate-server && \

            # Move the binaries to a directory in your PATH, for example /usr/local/bin (needs sudo):
            sudo mv restate $BIN && \
            sudo mv restate-server $BIN
            ```

        Then run the Restate Server with:
        ```shell
        restate-server
        ```

            Install Restate Server and CLI via:

            ```shell !result
            npm install --global @restatedev/restate-server@latest @restatedev/restate@latest
            ```

            Then run the Restate Server with:
            ```shell !result
            restate-server
            ```

        To run the Restate Server:

        ```shell
        docker run --name restate_dev --rm -p 8080:8080 -p 9070:9070 -p 9071:9071 \
        --add-host=host.docker.internal:host-gateway docker.restate.dev/restatedev/restate:VAR::RESTATE_VERSION
        ```

        To run commands with the Restate CLI, use the following command:

        ```shell
        docker run -it --network=host docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION invocations ls
        ```

        Replace `invocations ls` with the CLI subcommand you want to run.

        #### `restatectl`

        The server and CLI images both contain the `restatectl` tool. To run `restatectl`, use the following command:

        ```shell
        docker run -it --network=host --entrypoint restatectl docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION nodes ls
        ```

        You can also execute `restatectl` in a running server container using the following command:

        ```shell
        docker exec restate_dev restatectl nodes ls
        ```

        Replace `restate_dev` with the name of a running container, and `nodes ls` with the subcommand you want to run.

Once Restate is running, you can find the UI at `http://localhost:9070`.

    Have a look at the [CLI configuration docs](/operate/configuration/cli) or [Server configuration docs](/operate/configuration/server) for more configuration options.

    Restate Server collects anonymized telemetry about the Restate versions being used and their uptime via [Scarf](https://about.scarf.sh).
    We don't have access to your IP or any information about your cluster.
    To disable this, set the environment variable `DO_NOT_TRACK=1`.

<details>
    <summary> Wiping Restate </summary>

    To start the Restate Server from a clean slate, stop the server and then delete the data directory:

    ```shell
    rm -rf <BASE_DIR>/<NODE_NAME>
    ```

</details>

## Restate UI
The UI is bundled together with the Restate Server and available at port 9070 (`http://localhost:9070` when running locally).
You can use the UI for managing, debugging and configuring your applications.

    Have a look at the [UI announcement blog post](https://restate.dev/blog/announcing-restate-ui/) to get some inspiration on how you can use the UI for your applications.

## Useful dev CLI commands

With the CLI installed, have a look at some useful commands to interact with the Restate Server:

    Check to which server you are connected:

    ```shell !result
    restate whoami
    ```

    Register a new service deployment.
    When running Restate with Docker, use `http://host.docker.internal:9080`.

    ```shell !result
    restate deployments register localhost:9080
    ```

    [Cancel](/operate/invocation#cancelling-invocations) a single invocation or a batch of invocations.
    Use `--kill` to [kill](/operate/invocation#killing-invocations) the invocation.
    To remove all invocations, stop the server then do `rm -rf <BASE_DIR>/<NODE_NAME>`, which will effectively delete all state/data of the Restate server.

    ```shell !result
    restate invocation cancel <INVOCATION_ID>
    # also works with /<SERVICE_KEY>/ or a subset of it
    ```

    Clear the K/V state of a Virtual Object or Workflows.
    To clear all state, stop the server then do  `rm -rf <BASE_DIR>/<NODE_NAME>`, which will effectively delete all state/data of the Restate server.

    ```shell !result
    restate kv clear <OBJECT_OR_WORKFLOW_NAME>
    restate kv clear <OBJECT_OR_WORKFLOW_NAME>/<SERVICE_KEY>
    ```

    Execute a SQL query on the invocation or application state.
    See [SQL introspection docs](/operate/introspection?interface=psql#inspecting-invocations) for example queries.
    Use `--json` to get the output in json format.

    ```shell !result
    restate sql "query"
    ```

    Have a look at the [introspection page](/operate/introspection) for a list of useful commands.
