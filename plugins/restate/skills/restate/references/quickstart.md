---
id: quickstart
[//]: # (sidebar_position: 2 --> this is now set by sidebars.js)
description: ""
---

# Quickstart

This guide takes you through your first steps with Restate.

We will run a simple Restate Greeter service that listens on port `9080` and responds with `You said hi to <name>!` to a `greet` request.

SDK:

     TypeScript
     Java
     Kotlin
     Go
     Python
     Rust

        Select your favorite runtime:

            Node.js

                    - [NodeJS](https://nodejs.org/en/) >= v18.17.1

            bun

                    - [Bun](https://bun.sh/docs/installation)
                    - [npm CLI](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) >= 9.6.7

            Deno

                    - [Deno](https://deno.land/#installation)
                    - [npm CLI](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) >= 9.6.7

            Cloudflare Workers

                    - [NodeJS](https://nodejs.org/en/) >= v18.17.1

            Next.js

                    - [NodeJS](https://nodejs.org/en/) >= v18.18

            Restate is a single self-contained binary. No external dependencies needed.

                        Install Restate Server and CLI.

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

                    Replace `invocations ls` by the CLI command you want to run.

            You can find the Restate UI running on port 9070 (`http://localhost:9070`) after starting the Restate Server.

                        ```shell !!tabs CLI
                        restate example typescript-hello-world &&
                        cd typescript-hello-world &&
                        npm install
                        ```

                        ```shell !!tabs npx
                        npx -y @restatedev/create-app@latest && cd restate-node-template &&
                        npm install
                        ```

                    ```shell
                    restate example typescript-bun-hello-world &&
                    cd typescript-bun-hello-world &&
                    npm install
                    ```

                    ```shell
                    restate example typescript-deno-hello-world &&
                    cd typescript-deno-hello-world
                    ```

                    ```shell
                    restate example typescript-cloudflare-worker-hello-world &&
                    cd typescript-cloudflare-worker-hello-world &&
                    npm install
                    ```

                    ```shell
                    restate example typescript-nextjs-hello-world &&
                    cd typescript-nextjs-hello-world &&
                    npm install
                    ```

            Run it and let it listen on port `9080` for requests:

                    ```shell !command
                    npm run dev
                    ```

                    ```log !output
                    > restate-ts-template@0.0.1 dev
                    > ts-node-dev --watch ./src --respawn --transpile-only ./src/app.ts

                    [INFO] 00:44:54 ts-node-dev ver. 2.0.0 (using ts-node ver. 10.9.2, typescript ver. 5.6.3)
                    [restate] [2024-11-12T23:44:54.955Z] INFO:  Listening on 9080...
                    ```

                        ```shell !command
                        npm run dev
                        ```

                        ```log !output
                        > restate-bun-template@0.0.1 dev
                        > bun run --watch src/index.ts

                        Listening on http://localhost:9080/
                        ```

                        ```shell !command
                        deno task dev
                        ```

                        ```log !output
                        Task dev deno run --allow-net --allow-env --watch main.ts
                        Watcher Process started.
                        Listening on http://0.0.0.0:9080/
                        ```

                        ```shell !command
                        npm run dev
                        ```

                        ```log !output
                        restate-cloudflare-worker-template@0.0.1 dev
                        > wrangler dev --port 9080

                        ⛅️ wrangler 3.88.0
                        -------------------

                        ╭────────────────────────────────────────────────────────────────────────────────────────⎔ Starting local server...
                        [wrangler:inf] Ready on http://localhost:9080
                        ```

                        ```shell !command
                        npm run dev
                        ```

                        ```log !output
                        > next-restate@0.1.0 dev
                        > next dev

                        ▲ Next.js 15.2.4
                        - Local:        http://localhost:3000
                        - Network:      http://192.168.1.68:3000

                        ✓ Starting...
                        ✓ Ready in 1406ms
                        ```

            Tell Restate where the service is running, so Restate can discover and register the services and handlers behind this endpoint.
            You can do this via the UI (`http://localhost:9070`) or via:

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:9080
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                                    "name": "Greeter",
                                    "handlers": [

                                            "name": "greet",
                                            "ty": "Shared",
                                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                            "output_description": "value of content-type 'application/json'"

                                    ],
                                    "ty": "Service",
                                    "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                                    "revision": 1,
                                    "public": true,
                                    "idempotency_retention": "1day"

                            ]

                        ```

                    If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:9080
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                                    "name": "Greeter",
                                    "handlers": [

                                            "name": "greet",
                                            "ty": "Shared",
                                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                            "output_description": "value of content-type 'application/json'"

                                    ],
                                    "ty": "Service",
                                    "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                                    "revision": 1,
                                    "public": true,
                                    "idempotency_retention": "1day"

                            ]

                        ```

                    If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:9080
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                                    "name": "Greeter",
                                    "handlers": [

                                            "name": "greet",
                                            "ty": "Shared",
                                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                            "output_description": "value of content-type 'application/json'"

                                    ],
                                    "ty": "Service",
                                    "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                                    "revision": 1,
                                    "public": true,
                                    "idempotency_retention": "1day"

                            ]

                        ```

                    If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:9080 --use-http1.1
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:9080", "use_http_11": true}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                                    "name": "Greeter",
                                    "handlers": [

                                            "name": "greet",
                                            "ty": "Shared",
                                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                            "output_description": "value of content-type 'application/json'"

                                    ],
                                    "ty": "Service",
                                    "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                                    "revision": 1,
                                    "public": true,
                                    "idempotency_retention": "1day"

                            ]

                        ```

                    The local Workers dev server does not support HTTP2, so we need to tell Restate to use HTTP1.1.

                    If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:3000/restate/v1 --use-http1.1
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:3000/restate/v1", "use_http_11": true}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                            "name": "Greeter",
                            "handlers": [

                            "name": "greet",
                            "ty": "Shared",
                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                            "output_description": "value of content-type 'application/json'"

                            ],
                            "ty": "Service",
                            "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "revision": 1,
                            "public": true,
                            "idempotency_retention": "1day"

                            ]

                        ```

                    If you run Restate with Docker, use `http://host.docker.internal:3000/restate/v1` instead of `http://localhost:3000/restate/v1`.

                When using [Restate Cloud](https://restate.dev/cloud), your service must be accessible over the public internet so Restate can invoke it.
                If you want to develop with a local service, you can expose it using our [tunnel](/deploy/server/cloud/#registering-restate-services-with-your-environment) feature.

                    Invoke the service via the Restate UI playground: go to `http://localhost:9070`, click on your service and then on playground.

                    Invoke the service via the Restate UI playground: go to `http://localhost:9070`,  click on your service and then on playground.

                    Invoke the service via the Restate UI playground: go to `http://localhost:9070`,  click on your service and then on playground.

                    Invoke the service via the Restate UI playground: go to `http://localhost:9070`,  click on your service and then on playground.

                    Invoke the greet handler via the Next.js UI at `http://localhost:3000`

            Or invoke via `curl`:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Sarah"}'
                ```
                ```shell !output
                You said hi to Sarah!
                ```

            The invocation you just sent used Durable Execution to make sure the request ran till completion.
            For each request, it sent a notification, slept for a second, and then sent a reminder.

                    ```ts https://github.com/restatedev/examples/blob/main/typescript/templates/node/src/app.ts
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/typescript/templates/node/src/app.ts
                    ```

                    ```ts https://github.com/restatedev/examples/blob/main/typescript/templates/bun/src/index.ts
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/typescript/templates/bun/src/index.ts
                    ```

                    ```ts https://github.com/restatedev/examples/blob/main/typescript/templates/deno/main.ts
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/typescript/templates/deno/main.ts
                    ```

                    ```ts https://github.com/restatedev/examples/blob/main/typescript/templates/cloudflare-worker/src/index.ts
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/typescript/templates/cloudflare-worker/src/index.ts
                    ```

                    ```ts https://github.com/restatedev/examples/blob/main/typescript/templates/nextjs/restate/services/greeter.ts
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/typescript/templates/nextjs/restate/services/greeter.ts
                    ```

            Send a request for `Alice` to see how the service behaves when it occasionally fails to send the reminder and notification:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Alice"}'
                ```
                ```shell !output
                You said hi to Alice!
                ```

            You can see in the service logs and in the Restate UI how the request gets retried.
            On a retry, it skipped the steps that already succeeded.

            Even the sleep is durable and tracked by Restate.
            If you kill/restart the service halfway through, the sleep will only last for what remained.

                Restate persists the progress of the handler.
                Letting you write code that is resilient to failures out of the box.
                Have a look at the [Durable Execution page](/concepts/durable_execution) to learn more.

                <details>

                    <summary>Next: Build and run the app</summary>

                    Once you have implemented your service, build the app and run it with:
                    ```shell
                    npm run build
                    npm run start
                    ```
                </details>

                <details>

                    <summary>Next: Build and run the app</summary>
                    ```shell
                    npm run build
                    npm run start
                    ```
                </details>

                <details>
                    <summary>Next: Build and run the app</summary>
                        ```shell
                        npm run build
                        npm run start
                        ```
                </details>

                <details>
                    <summary>Next: Build and run the app</summary>
                        ```shell
                        npm run build
                        npm run start
                        ```
                </details>

        Build tool:

            Maven
                Framework:

                    Spring Boot

                            - [JDK](https://whichjdk.com/) >= 17

                    Quarkus

                            - [JDK](https://whichjdk.com/) >= 17
                            - [Quarkus](https://quarkus.io/get-started/)

                    Vanilla

                            - [JDK](https://whichjdk.com/) >= 17

            Gradle
                Framework:

                    Vanilla

                            - [JDK](https://whichjdk.com/) >= 17

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

                    To run the Restate Server:

                    ```shell
                    docker run --name restate_dev --rm -p 8080:8080 -p 9070:9070 -p 9071:9071 \
                    --add-host=host.docker.internal:host-gateway docker.restate.dev/restatedev/restate:VAR::RESTATE_VERSION
                    ```

                    To run commands with the Restate CLI, use the following command:

                    ```shell
                    docker run -it --network=host docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION invocations ls
                    ```

                    Replace `invocations ls` by the CLI command you want to run.

            You can find the Restate UI running on port 9070 (`http://localhost:9070`) after starting the Restate Server.

                                ```shell !!tabs CLI
                                restate example java-hello-world-maven-spring-boot &&
                                cd java-hello-world-maven-spring-boot
                                ```

                                ```shell !!tabs wget
                                wget https://github.com/restatedev/examples/releases/latest/download/java-hello-world-maven-spring-boot.zip &&
                                unzip java-hello-world-maven-spring-boot.zip -d java-hello-world-maven-spring-boot &&
                                rm java-hello-world-maven-spring-boot.zip && cd java-hello-world-maven-spring-boot
                                ```

                                ```shell !!tabs CLI
                                restate example java-hello-world-maven-quarkus &&
                                cd java-hello-world-maven-quarkus
                                ```

                                ```shell !!tabs wget
                                wget https://github.com/restatedev/examples/releases/latest/download/java-hello-world-maven-quarkus.zip &&
                                unzip java-hello-world-maven-quarkus.zip -d java-hello-world-maven-quarkus &&
                                rm java-hello-world-maven-quarkus.zip && cd java-hello-world-maven-quarkus
                                ```

                                ```shell !!tabs CLI
                                restate example java-hello-world-maven &&
                                cd java-hello-world-maven
                                ```

                                ```shell !!tabs wget
                                wget https://github.com/restatedev/examples/releases/latest/download/java-hello-world-maven.zip &&
                                unzip java-hello-world-maven.zip -d java-hello-world-maven &&
                                rm java-hello-world-maven.zip && cd java-hello-world-maven
                                ```

                        Vanilla

                                ```shell !!tabs CLI
                                restate example java-hello-world-gradle &&
                                cd java-hello-world-gradle
                                ```

                                ```shell !!tabs wget
                                wget https://github.com/restatedev/examples/releases/latest/download/java-hello-world-gradle.zip &&
                                unzip java-hello-world-gradle.zip -d java-hello-world-gradle &&
                                rm java-hello-world-gradle.zip && cd java-hello-world-gradle
                                ```

                            You are all set to start developing your service.
                            Open the project in an IDE, run your service and let it listen on port `9080` for requests:

                            ```shell
                            mvn compile spring-boot:run
                            ```

                            You are all set to start developing your service.
                            Open the project in an IDE, run your service and let it listen on port `9080` for requests:

                            ```shell
                            quarkus dev
                            ```

                            You are all set to start developing your service.
                            Open the project in an IDE, run your service and let it listen on port `9080` for requests:

                            ```shell
                            mvn compile exec:java
                            ```

                        Vanilla
                            You are all set to start developing your service.
                            Open the project in an IDE, run your service and let it listen on port `9080` for requests:

                            ```shell
                            ./gradlew run
                            ```

            Tell Restate where the service is running, so Restate can discover and register the services and handlers behind this endpoint.
            You can do this via the UI (`http://localhost:9070`) or via:

                # !!terminals

                ```shell !command CLI
                restate deployments register http://localhost:9080
                ```

                ```shell !output
                ❯ SERVICES THAT WILL BE ADDED:
                - Greeter
                Type: Service
                HANDLER  INPUT                                     OUTPUT
                greet    value of content-type 'application/json'  value of content-type 'application/json'

                ✔ Are you sure you want to apply those changes? · yes
                ✅ DEPLOYMENT:
                SERVICE  REV
                Greeter  1
                ```

                # !!terminals

                ```shell !command curl
                curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                ```

                ```shell !output

                    "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                    "services": [

                            "name": "Greeter",
                            "handlers": [

                                    "name": "greet",
                                    "ty": "Shared",
                                    "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                    "output_description": "value of content-type 'application/json'"

                            ],
                            "ty": "Service",
                            "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "revision": 1,
                            "public": true,
                            "idempotency_retention": "1day"

                    ]

                ```

            If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

            Invoke the service via the Restate UI playground: go to `http://localhost:9070`, click on your service and then on playground.

            Or invoke via `curl`:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Sarah"}'
                ```

                ```log !output
                You said hi to Sarah!
                ```

            The invocation you just sent used Durable Execution to make sure the request ran till completion.
            For each request, it sent a notification, slept for a second, and then sent a reminder.

                            ```java https://github.com/restatedev/examples/blob/main/java/templates/java-maven-spring-boot/src/main/java/com/example/restatestarter/Greeter.java
                            // collapse_prequel
                            CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/java/templates/java-maven-spring-boot/src/main/java/com/example/restatestarter/Greeter.java
                            ```

                            ```java https://github.com/restatedev/examples/blob/main/java/templates/java-maven-quarkus/src/main/java/org/acme/Greeter.java
                            // collapse_prequel
                            CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/java/templates/java-maven-quarkus/src/main/java/org/acme/Greeter.java
                            ```

                            ```java https://github.com/restatedev/examples/blob/main/java/templates/java-maven/src/main/java/my/example/Greeter.java
                            // collapse_prequel
                            CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/java/templates/java-maven/src/main/java/my/example/Greeter.java
                            ```

                            ```java https://github.com/restatedev/examples/blob/main/java/templates/java-gradle/src/main/java/my/example/Greeter.java
                            // collapse_prequel
                            CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/java/templates/java-gradle/src/main/java/my/example/Greeter.java
                            ```

            Send a request for `Alice` to see how the service behaves when it occasionally fails to send the reminder and notification:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name":"Alice"}'
                ```
                ```shell !output
                You said hi to Alice!
                ```

            You can see in the service logs and in the Restate UI how the request gets retried.
            On a retry, it skipped the steps that already succeeded.

            Even the sleep is durable and tracked by Restate.
            If you kill/restart the service halfway through, the sleep will only last for what remained.

                Restate persists the progress of the handler.
                Letting you write code that is resilient to failures out of the box.
                Have a look at the [Durable Execution page](/concepts/durable_execution) to learn more.

        Framework:

            Spring Boot
            Vanilla

            - [JDK](https://whichjdk.com/) >= 17

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

                    To run the Restate Server:

                    ```shell
                    docker run --name restate_dev --rm -p 8080:8080 -p 9070:9070 -p 9071:9071 \
                    --add-host=host.docker.internal:host-gateway docker.restate.dev/restatedev/restate:VAR::RESTATE_VERSION
                    ```

                    To run commands with the Restate CLI, use the following command:

                    ```shell
                    docker run -it --network=host docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION invocations ls
                    ```

                    Replace `invocations ls` by the CLI command you want to run.

            You can find the Restate UI running on port 9070 (`http://localhost:9070`) after starting the Restate Server.

                        ```shell !!tabs CLI
                        restate example kotlin-hello-world-gradle-spring-boot &&
                        cd kotlin-hello-world-gradle-spring-boot
                        ```

                        ```shell !!tabs wget
                        wget https://github.com/restatedev/examples/releases/latest/download/kotlin-hello-world-gradle-spring-boot.zip &&
                        unzip kotlin-hello-world-gradle-spring-boot.zip -d kotlin-hello-world-gradle-spring-boot &&
                        rm kotlin-hello-world-gradle-spring-boot.zip && cd kotlin-hello-world-gradle-spring-boot
                        ```

                        ```shell !!tabs CLI
                        restate example kotlin-hello-world-gradle &&
                        cd kotlin-hello-world-gradle
                        ```

                        ```shell !!tabs wget
                        wget https://github.com/restatedev/examples/releases/latest/download/kotlin-hello-world-gradle.zip &&
                        unzip kotlin-hello-world-gradle.zip -d kotlin-hello-world-gradle &&
                        rm kotlin-hello-world-gradle.zip && cd kotlin-hello-world-gradle
                        ```

            You are all set to start developing your service.
            Open the project in an IDE and configure it to build with Gradle.
            Run your service and let it listen on port `9080` for requests:

                        ```shell
                        ./gradlew bootRun
                        ```

                    ```shell
                    ./gradlew run
                    ```

            Tell Restate where the service is running, so Restate can discover and register the services and handlers behind this endpoint.
            You can do this via the UI (`http://localhost:9070`) or via:

                # !!terminals

                ```shell !command CLI
                restate deployments register http://localhost:9080
                ```

                ```shell !output
                ❯ SERVICES THAT WILL BE ADDED:
                - Greeter
                Type: Service
                HANDLER  INPUT                                     OUTPUT
                greet    value of content-type 'application/json'  value of content-type 'application/json'

                ✔ Are you sure you want to apply those changes? · yes
                ✅ DEPLOYMENT:
                SERVICE  REV
                Greeter  1
                ```

                # !!terminals

                ```shell !command curl
                curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                ```

                ```shell !output

                    "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                    "services": [

                            "name": "Greeter",
                            "handlers": [

                                    "name": "greet",
                                    "ty": "Shared",
                                    "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                    "output_description": "value of content-type 'application/json'"

                            ],
                            "ty": "Service",
                            "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "revision": 1,
                            "public": true,
                            "idempotency_retention": "1day"

                    ]

                ```

            If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

            Invoke the service via the Restate UI playground: go to `http://localhost:9070`, click on your service and then on playground.

            Or invoke via `curl`:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Sarah"}'
                ```

                ```log !output
                You said hi to Sarah!
                ```

            The invocation you just sent used Durable Execution to make sure the request ran till completion.
            For each request, it sent a notification, slept for a second, and then sent a reminder.

                    ```kotlin https://github.com/restatedev/examples/blob/main/kotlin/templates/kotlin-gradle-spring-boot/src/main/kotlin/com/example/restatestarter/Greeter.kt
                    // collapse_prequel
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/kotlin/templates/kotlin-gradle-spring-boot/src/main/kotlin/com/example/restatestarter/Greeter.kt
                    ```

                    ```kotlin https://github.com/restatedev/examples/blob/main/kotlin/templates/kotlin-gradle/src/main/kotlin/my/example/Greeter.kt
                    // collapse_prequel
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/kotlin/templates/kotlin-gradle/src/main/kotlin/my/example/Greeter.kt
                    ```

            Send a request for `Alice` to see how the service behaves when it occasionally fails to send the reminder and notification:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Alice"}'
                ```
                ```shell !output
                You said hi to Alice!
                ```

            You can see in the service logs and in the Restate UI how the request gets retried.
            On a retry, it skipped the steps that already succeeded.

            Even the sleep is durable and tracked by Restate.
            If you kill/restart the service halfway through, the sleep will only last for what remained.

                Restate persists the progress of the handler.
                Letting you write code that is resilient to failures out of the box.
                Have a look at the [Durable Execution page](/concepts/durable_execution) to learn more.

            - Go: >= 1.21.0

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

                    To run the Restate Server:

                    ```shell
                    docker run --name restate_dev --rm -p 8080:8080 -p 9070:9070 -p 9071:9071 \
                    --add-host=host.docker.internal:host-gateway docker.restate.dev/restatedev/restate:VAR::RESTATE_VERSION
                    ```

                    To run commands with the Restate CLI, use the following command:

                    ```shell
                    docker run -it --network=host docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION invocations ls
                    ```

                    Replace `invocations ls` by the CLI command you want to run.

            You can find the Restate UI running on port 9070 (`http://localhost:9070`) after starting the Restate Server.

                ```shell !!tabs CLI
                restate example go-hello-world &&
                cd go-hello-world
                ```

                ```shell !!tabs wget
                wget https://github.com/restatedev/examples/releases/latest/download/go-hello-world.zip &&
                unzip go-hello-world.zip -d go-hello-world &&
                rm go-hello-world.zip && cd go-hello-world
                ```

            Now, start developing your service in `greeter.go`. Run it with:
            ```shell
            go run .
            ```
            it will listen on port 9080 for requests.

            Tell Restate where the service is running, so Restate can discover and register the services and handlers behind this endpoint.
            You can do this via the UI (`http://localhost:9070`) or via:

                # !!terminals

                ```shell !command CLI
                restate deployments register http://localhost:9080
                ```

                ```shell !output
                ❯ SERVICES THAT WILL BE ADDED:
                - Greeter
                Type: Service
                HANDLER  INPUT                                     OUTPUT
                Greet    value of content-type 'application/json'  value of content-type 'application/json'

                ✔ Are you sure you want to apply those changes? · yes
                ✅ DEPLOYMENT:
                SERVICE  REV
                Greeter  1
                ```

                # !!terminals

                ```shell !command curl
                curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                ```

                ```shell !output

                    "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                    "services": [

                            "name": "Greeter",
                            "handlers": [

                                    "name": "Greet",
                                    "ty": "Shared",
                                    "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                    "output_description": "value of content-type 'application/json'"

                            ],
                            "ty": "Service",
                            "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "revision": 1,
                            "public": true,
                            "idempotency_retention": "1day"

                    ]

                ```

            If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

            Invoke the service via the Restate UI playground: go to `http://localhost:9070`, click on your service and then on playground.

            Or invoke via `curl`:

                ```shell !command
                curl localhost:8080/Greeter/Greet --json '"Sarah"'
                ```

                ```shell !output
                You said hi to Sarah!
                ```

            The invocation you just sent used Durable Execution to make sure the request ran till completion.
            For each request, it sent a notification, slept for a second, and then sent a reminder.

            ```go https://github.com/restatedev/examples/blob/main/go/templates/go/greeter.go
            // collapse_prequel
            CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/go/templates/go/greeter.go
            ```

            Send a request for `Alice` to see how the service behaves when it occasionally fails to send the reminder and notification:

                ```shell !command
                curl localhost:8080/Greeter/Greet --json '"Alice"'
                ```
                ```shell !output
                You said hi to Alice!
                ```

            You can see in the service logs and in the Restate UI how the request gets retried.
            On a retry, it skipped the steps that already succeeded.

            Even the sleep is durable and tracked by Restate.
            If you kill/restart the service halfway through, the sleep will only last for what remained.

                Restate persists the progress of the handler.
                Letting you write code that is resilient to failures out of the box.
                Have a look at the [Durable Execution page](/concepts/durable_execution) to learn more.

        <details>

            <summary>Next: Build and run the app</summary>

            Once you have implemented your service, build the app with:

            ```shell
            go build .
            ```

        </details>

            - Python >= v3.11
            - [uv](https://docs.astral.sh/uv/getting-started/installation/)

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

                    To run the Restate Server:

                    ```shell
                    docker run --name restate_dev --rm -p 8080:8080 -p 9070:9070 -p 9071:9071 \
                    --add-host=host.docker.internal:host-gateway docker.restate.dev/restatedev/restate:VAR::RESTATE_VERSION
                    ```

                    To run commands with the Restate CLI, use the following command:

                    ```shell
                    docker run -it --network=host docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION invocations ls
                    ```

                    Replace `invocations ls` by the CLI command you want to run.

            You can find the Restate UI running on port 9070 (`http://localhost:9070`) after starting the Restate Server.

                ```shell !!tabs CLI
                restate example python-hello-world &&
                cd python-hello-world
                ```

                ```shell !!tabs wget
                wget https://github.com/restatedev/examples/releases/latest/download/python-hello-world.zip &&
                unzip python-hello-world.zip -d python-hello-world &&
                rm python-hello-world.zip && cd python-hello-world
                ```

            Run it and let it listen on port 9080 for requests:

            ```shell
            uv run .
            ```

            Tell Restate where the service is running, so Restate can discover and register the services and handlers behind this endpoint.
            You can do this via the UI (`http://localhost:9070`) or via:

                # !!terminals

                ```shell !command CLI
                restate deployments register http://localhost:9080
                ```

                ```shell !output
                ❯ SERVICES THAT WILL BE ADDED:
                - Greeter
                Type: Service
                HANDLER  INPUT                                     OUTPUT
                greet    value of content-type 'application/json'  value of content-type 'application/json'

                ✔ Are you sure you want to apply those changes? · yes
                ✅ DEPLOYMENT:
                SERVICE  REV
                Greeter  1
                ```

                # !!terminals

                ```shell !command curl
                curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                ```

                ```shell !output

                    "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                    "services": [

                            "name": "Greeter",
                            "handlers": [

                                    "name": "greet",
                                    "ty": "Shared",
                                    "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                    "output_description": "value of content-type 'application/json'"

                            ],
                            "ty": "Service",
                            "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "revision": 1,
                            "public": true,
                            "idempotency_retention": "1day"

                    ]

                ```

            If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

            Invoke the service via the Restate UI playground: go to `http://localhost:9070`, click on your service and then on playground.

            Or invoke via `curl`:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Sarah"}'
                ```

                ```shell !output
                You said hi to Sarah!
                ```

            The invocation you just sent used Durable Execution to make sure the request ran till completion.
            For each request, it sent a notification, slept for a second, and then sent a reminder.

            ```python https://github.com/restatedev/examples/blob/main/python/templates/python/app/greeter.py
            # collapse_prequel
            CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/python/templates/python/app/greeter.py
            ```

            Send a request for `Alice` to see how the service behaves when it occasionally fails to send the reminder and notification:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '{"name": "Alice"}'
                ```
                ```shell !output
                You said hi to Alice!
                ```

            You can see in the service logs and in the Restate UI how the request gets retried.
            On a retry, it skipped the steps that already succeeded.

            Even the sleep is durable and tracked by Restate.
            If you kill/restart the service halfway through, the sleep will only last for what remained.

                Restate persists the progress of the handler.
                Letting you write code that is resilient to failures out of the box.
                Have a look at the [Durable Execution page](/concepts/durable_execution) to learn more.

        Select your favorite runtime:

            Tokio

                    - [Rust](https://rustup.rs/)

            Shuttle

                    - [Rust](https://rustup.rs/)
                    - [Shuttle](https://docs.shuttle.dev/getting-started/installation)

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

                    To run the Restate Server:

                    ```shell
                    docker run --name restate_dev --rm -p 8080:8080 -p 9070:9070 -p 9071:9071 \
                    --add-host=host.docker.internal:host-gateway docker.restate.dev/restatedev/restate:VAR::RESTATE_VERSION
                    ```

                    To run commands with the Restate CLI, use the following command:

                    ```shell
                    docker run -it --network=host docker.restate.dev/restatedev/restate-cli:VAR::RESTATE_VERSION invocations ls
                    ```

                    Replace `invocations ls` by the CLI command you want to run.

            You can find the Restate UI running on port 9070 (`http://localhost:9070`) after starting the Restate Server.

                        ```shell !!tabs CLI
                        restate example rust-hello-world &&
                        cd rust-hello-world
                        ```

                        ```shell !!tabs wget
                        wget https://github.com/restatedev/examples/releases/latest/download/rust-hello-world.zip &&
                        unzip rust-hello-world.zip -d rust-hello-world &&
                        rm rust-hello-world.zip && cd rust-hello-world
                        ```

                        ```shell !!tabs CLI
                        restate example rust-shuttle-hello-world &&
                        cd rust-shuttle-hello-world
                        ```

                        ```shell !!tabs wget
                        wget https://github.com/restatedev/examples/releases/latest/download/rust-shuttle-hello-world.zip &&
                        unzip rust-shuttle-hello-world.zip -d rust-shuttle-hello-world &&
                        rm rust-shuttle-hello-world.zip && cd rust-shuttle-hello-world
                        ```

                    ```shell
                    cargo run
                    ```

                    ```shell
                    cargo shuttle run --port 9080
                    ```

            Tell Restate where the service is running, so Restate can discover and register the services and handlers behind this endpoint.
            You can do this via the UI (`http://localhost:9070`) or via:

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:9080
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:9080"}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                                    "name": "Greeter",
                                    "handlers": [

                                            "name": "greet",
                                            "ty": "Shared",
                                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                            "output_description": "value of content-type 'application/json'"

                                    ],
                                    "ty": "Service",
                                    "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                                    "revision": 1,
                                    "public": true,
                                    "idempotency_retention": "1day"

                            ]

                        ```

                        # !!terminals

                        ```shell !command CLI
                        restate deployments register http://localhost:9080 --use-http1.1
                        ```

                        ```shell !output
                        ❯ SERVICES THAT WILL BE ADDED:
                        - Greeter
                        Type: Service
                        HANDLER  INPUT                                     OUTPUT
                        greet    value of content-type 'application/json'  value of content-type 'application/json'

                        ✔ Are you sure you want to apply those changes? · yes
                        ✅ DEPLOYMENT:
                        SERVICE  REV
                        Greeter  1
                        ```

                        # !!terminals

                        ```shell !command curl
                        curl localhost:9070/deployments --json '{"uri": "http://localhost:9080", "use_http_11": true}'
                        ```

                        ```shell !output

                            "id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                            "services": [

                                    "name": "Greeter",
                                    "handlers": [

                                            "name": "greet",
                                            "ty": "Shared",
                                            "input_description": "one of [\"none\", \"value of content-type 'application/json'\"]",
                                            "output_description": "value of content-type 'application/json'"

                                    ],
                                    "ty": "Service",
                                    "deployment_id": "dp_17sztQp4gnEC1L0OCFM9aEh",
                                    "revision": 1,
                                    "public": true,
                                    "idempotency_retention": "1day"

                            ]

                        ```

            If you run Restate with Docker, use `http://host.docker.internal:9080` instead of `http://localhost:9080`.

            Invoke the service via the Restate UI playground: go to `http://localhost:9070`, click on your service and then on playground.

            Or invoke via `curl`:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '"Sarah"'
                ```

                ```log !output
                You said hi to Sarah!
                ```

            The invocation you just sent used Durable Execution to make sure the request ran till completion.
            For each request, it sent a notification, slept for a second, and then sent a reminder.

                    ```rust https://github.com/restatedev/examples/blob/main/rust/templates/rust/src/main.rs
                    // collapse_prequel
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/rust/templates/rust/src/main.rs
                    ```

                    ```rust https://github.com/restatedev/examples/blob/main/rust/templates/rust-shuttle/src/main.rs
                    // collapse_prequel
                    CODE_LOAD::https://raw.githubusercontent.com/restatedev/examples/refs/heads/main/rust/templates/rust-shuttle/src/main.rs
                    ```

            Send a request for `Alice` to see how the service behaves when it occasionally fails to send the reminder and notification:

                ```shell !command
                curl localhost:8080/Greeter/greet --json '"Alice"'
                ```
                ```shell !output
                You said hi to Alice!
                ```

            You can see in the service logs and in the Restate UI how the request gets retried.
            On a retry, it skipped the steps that already succeeded.

            Even the sleep is durable and tracked by Restate.
            If you kill/restart the service halfway through, the sleep will only last for what remained.

                Restate persists the progress of the handler.
                Letting you write code that is resilient to failures out of the box.
                Have a look at the [Durable Execution page](/concepts/durable_execution) to learn more.

## Next steps
- Read the [Concepts](/concepts/durable_building_blocks)
- Discover the key features of Restate in the [Tour of Restate](/get_started/tour)
- [Run the examples](https://github.com/restatedev/examples)
