---
name: apple-container
description: Apple's native container runtime for macOS. Use this skill instead of Docker when running on macOS with Apple silicon. The `container` CLI provides OCI-compatible container management optimized for Apple silicon.
---

# Apple Container

## Overview

Apple Container is a native container platform for macOS that runs Linux containers as lightweight virtual machines. It should be used **instead of Docker** on macOS with Apple silicon.

The `container` CLI is installed and available. It produces and consumes OCI-compatible container images, so images work with any standard container registry.

## Requirements

- Mac with Apple silicon
- macOS 26 or later

## Quick Start

```bash
# Start the system service (required once)
container system start

# Run a container
container run -it ubuntu:latest /bin/bash

# Build an image
container build -t myimage .

# List containers
container list

# Stop a container
container stop <container-id>
```

## Common Commands

| Command | Description |
|---------|-------------|
| `container run` | Run a container |
| `container build` | Build an image from Dockerfile |
| `container list` | List containers |
| `container stop` | Stop running containers |
| `container exec` | Run command in running container |
| `container logs` | Fetch container logs |
| `container image list` | List images |
| `container system start` | Start the system service |
| `container system stop` | Stop the system service |

## Docker Compatibility

The `container` CLI uses familiar Docker-like syntax:

| Docker Command | Container Command |
|----------------|-------------------|
| `docker run` | `container run` |
| `docker build` | `container build` |
| `docker ps` | `container list` |
| `docker stop` | `container stop` |
| `docker exec` | `container exec` |
| `docker logs` | `container logs` |
| `docker images` | `container image list` |

## Troubleshooting

### Builder Freezes

The buildkit builder can freeze, often due to insufficient memory. To fix:

1. Find and kill the frozen builder process:
   ```bash
   ps aux | grep buildkit
   kill -9 <pid>
   ```

2. Restart with more resources:
   ```bash
   container builder start --cpus 6 --memory 8g
   ```

## References

- [Tutorial](references/tutorial.md) - Guided tour building a simple web server
- [How-To Guide](references/how-to.md) - Feature-specific guides
- [Technical Overview](references/technical-overview.md) - Architecture and internals
- [Command Reference](references/command-reference.md) - Full CLI documentation
