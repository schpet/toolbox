#!/usr/bin/env bash
# sync-docs.sh - Fetch Restate documentation from official sources
# This script is idempotent and can be re-run to update docs
# Focus: TypeScript SDK and core concepts (excludes Python for v1)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PLUGIN_ROOT="$(dirname "$SCRIPT_DIR")"
SKILL_DIR="$PLUGIN_ROOT/skills/restate"
REFS_DIR="$SKILL_DIR/references"
SKILL_TEMPLATE="$SKILL_DIR/SKILL.template.md"
SKILL_MD="$SKILL_DIR/SKILL.md"
TMP_DIR="${TMPDIR:-/tmp}/restate-docs-$$"

# Cleanup function
cleanup() {
    rm -rf "$TMP_DIR" 2>/dev/null || true
}
trap cleanup EXIT

echo "==> Syncing Restate documentation..."
echo "    Plugin root: $PLUGIN_ROOT"
echo "    References directory: $REFS_DIR"

# Create directories
mkdir -p "$REFS_DIR"
mkdir -p "$TMP_DIR"

# -----------------------------------------------------------------------------
# Fetch official documentation from docs repository
# -----------------------------------------------------------------------------
echo ""
echo "==> Cloning Restate documentation repository..."

DOCS_REPO="https://github.com/restatedev/documentation"
DOCS_DIR="$TMP_DIR/documentation"

git clone --depth 1 "$DOCS_REPO" "$DOCS_DIR" 2>&1 | grep -v "^remote:" || true

echo ""
echo "==> Copying documentation files..."

# Helper function to copy and convert mdx to md
copy_doc() {
    local src="$1"
    local dest="$2"
    if [[ -f "$src" ]]; then
        cp "$src" "$dest"
        echo "    Copied: $(basename "$dest")"
        return 0
    else
        echo "    SKIP (not found): $(basename "$dest")"
        return 1
    fi
}

# -----------------------------------------------------------------------------
# Core Concepts
# -----------------------------------------------------------------------------
echo ""
echo "--- Concepts ---"

copy_doc "$DOCS_DIR/docs/concepts/services.mdx" "$REFS_DIR/concepts-services.md" || true
copy_doc "$DOCS_DIR/docs/concepts/invocations.mdx" "$REFS_DIR/concepts-invocations.md" || true
copy_doc "$DOCS_DIR/docs/concepts/durable_execution.mdx" "$REFS_DIR/concepts-durable-execution.md" || true
copy_doc "$DOCS_DIR/docs/concepts/durable_building_blocks.mdx" "$REFS_DIR/concepts-durable-building-blocks.md" || true

# -----------------------------------------------------------------------------
# Getting Started
# -----------------------------------------------------------------------------
echo ""
echo "--- Getting Started ---"

copy_doc "$DOCS_DIR/docs/get_started/quickstart.mdx" "$REFS_DIR/quickstart.md" || true
copy_doc "$DOCS_DIR/docs/get_started/tour.mdx" "$REFS_DIR/tour.md" || true
copy_doc "$DOCS_DIR/docs/overview.mdx" "$REFS_DIR/overview.md" || true
copy_doc "$DOCS_DIR/docs/develop/local_dev.mdx" "$REFS_DIR/local-dev.md" || true

# -----------------------------------------------------------------------------
# TypeScript SDK Documentation
# -----------------------------------------------------------------------------
echo ""
echo "--- TypeScript SDK ---"

copy_doc "$DOCS_DIR/docs/develop/ts/overview.mdx" "$REFS_DIR/ts-overview.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/state.mdx" "$REFS_DIR/ts-state.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/journaling-results.mdx" "$REFS_DIR/ts-journaling-results.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/durable-timers.mdx" "$REFS_DIR/ts-durable-timers.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/error-handling.mdx" "$REFS_DIR/ts-error-handling.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/service-communication.mdx" "$REFS_DIR/ts-service-communication.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/awakeables.mdx" "$REFS_DIR/ts-awakeables.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/serving.mdx" "$REFS_DIR/ts-serving.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/logging.mdx" "$REFS_DIR/ts-logging.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/serialization.mdx" "$REFS_DIR/ts-serialization.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/testing.mdx" "$REFS_DIR/ts-testing.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/workflows.mdx" "$REFS_DIR/ts-workflows.md" || true
copy_doc "$DOCS_DIR/docs/develop/ts/clients.mdx" "$REFS_DIR/ts-clients.md" || true

# -----------------------------------------------------------------------------
# Guides
# -----------------------------------------------------------------------------
echo ""
echo "--- Guides ---"

copy_doc "$DOCS_DIR/docs/guides/error-handling.mdx" "$REFS_DIR/guide-error-handling.md" || true
copy_doc "$DOCS_DIR/docs/guides/sagas.mdx" "$REFS_DIR/guide-sagas.md" || true
copy_doc "$DOCS_DIR/docs/guides/cron.mdx" "$REFS_DIR/guide-cron.md" || true
copy_doc "$DOCS_DIR/docs/guides/parallelizing-work.mdx" "$REFS_DIR/guide-parallelizing-work.md" || true
copy_doc "$DOCS_DIR/docs/guides/databases.mdx" "$REFS_DIR/guide-databases.md" || true
copy_doc "$DOCS_DIR/docs/guides/durable-webhooks.mdx" "$REFS_DIR/guide-durable-webhooks.md" || true
copy_doc "$DOCS_DIR/docs/guides/lambda-ts.mdx" "$REFS_DIR/guide-lambda-ts.md" || true

# -----------------------------------------------------------------------------
# Use Cases
# -----------------------------------------------------------------------------
echo ""
echo "--- Use Cases ---"

copy_doc "$DOCS_DIR/docs/use-cases/workflows.mdx" "$REFS_DIR/usecase-workflows.md" || true
copy_doc "$DOCS_DIR/docs/use-cases/async-tasks.mdx" "$REFS_DIR/usecase-async-tasks.md" || true
copy_doc "$DOCS_DIR/docs/use-cases/event-processing.mdx" "$REFS_DIR/usecase-event-processing.md" || true
copy_doc "$DOCS_DIR/docs/use-cases/microservice-orchestration.mdx" "$REFS_DIR/usecase-microservice-orchestration.md" || true

# -----------------------------------------------------------------------------
# Invocation
# -----------------------------------------------------------------------------
echo ""
echo "--- Invocation ---"

copy_doc "$DOCS_DIR/docs/invoke/http.mdx" "$REFS_DIR/invoke-http.md" || true
copy_doc "$DOCS_DIR/docs/invoke/clients.mdx" "$REFS_DIR/invoke-clients.md" || true
copy_doc "$DOCS_DIR/docs/invoke/kafka.mdx" "$REFS_DIR/invoke-kafka.md" || true

# -----------------------------------------------------------------------------
# Operations
# -----------------------------------------------------------------------------
echo ""
echo "--- Operations ---"

copy_doc "$DOCS_DIR/docs/operate/operate.mdx" "$REFS_DIR/operate-overview.md" || true
copy_doc "$DOCS_DIR/docs/operate/invocation.mdx" "$REFS_DIR/operate-invocation.md" || true
copy_doc "$DOCS_DIR/docs/operate/introspection.mdx" "$REFS_DIR/operate-introspection.md" || true
copy_doc "$DOCS_DIR/docs/operate/versioning.mdx" "$REFS_DIR/operate-versioning.md" || true
copy_doc "$DOCS_DIR/docs/operate/registration.mdx" "$REFS_DIR/operate-registration.md" || true
copy_doc "$DOCS_DIR/docs/operate/configuration/services.mdx" "$REFS_DIR/operate-services-config.md" || true

# -----------------------------------------------------------------------------
# References
# -----------------------------------------------------------------------------
echo ""
echo "--- References ---"

copy_doc "$DOCS_DIR/docs/references/architecture.mdx" "$REFS_DIR/architecture.md" || true

# -----------------------------------------------------------------------------
# TypeScript SDK README from SDK repository
# -----------------------------------------------------------------------------
echo ""
echo "==> Fetching TypeScript SDK README..."

TS_SDK_README="$TMP_DIR/sdk-typescript-readme.md"
if curl -fsSL "https://raw.githubusercontent.com/restatedev/sdk-typescript/main/README.md" -o "$TS_SDK_README" 2>/dev/null; then
    cp "$TS_SDK_README" "$REFS_DIR/typescript-sdk-readme.md"
    echo "    Copied: typescript-sdk-readme.md"
else
    echo "    SKIP (download failed): typescript-sdk-readme.md"
fi

# -----------------------------------------------------------------------------
# Generate SKILL.md from template
# -----------------------------------------------------------------------------
echo ""
echo "==> Generating SKILL.md from template..."

# Build the references section dynamically
generate_references() {
    cat << 'EOF'
### Concepts
- [Services](./references/concepts-services.md) - Service types and use cases
- [Invocations](./references/concepts-invocations.md) - How invocations work
- [Durable Execution](./references/concepts-durable-execution.md) - Execution guarantees
- [Durable Building Blocks](./references/concepts-durable-building-blocks.md) - SDK primitives

### TypeScript SDK
- [Overview](./references/ts-overview.md) - SDK setup and service definitions
- [State](./references/ts-state.md) - K/V state management
- [Journaling Results](./references/ts-journaling-results.md) - Side effects and `ctx.run()`
- [Durable Timers](./references/ts-durable-timers.md) - Sleep and scheduling
- [Service Communication](./references/ts-service-communication.md) - Calling other services
- [Awakeables](./references/ts-awakeables.md) - External events
- [Workflows](./references/ts-workflows.md) - Workflow implementation
- [Error Handling](./references/ts-error-handling.md) - Error patterns
- [Serving](./references/ts-serving.md) - Running services
- [Testing](./references/ts-testing.md) - Testing strategies
- [Clients](./references/ts-clients.md) - Client SDK

### Guides
- [Error Handling](./references/guide-error-handling.md) - Comprehensive error handling
- [Sagas](./references/guide-sagas.md) - Saga pattern with compensations
- [Cron Jobs](./references/guide-cron.md) - Scheduled tasks
- [Parallelizing Work](./references/guide-parallelizing-work.md) - Fan-out patterns
- [Databases](./references/guide-databases.md) - Database integration
- [Lambda Deployment](./references/guide-lambda-ts.md) - AWS Lambda deployment

### Use Cases
- [Workflows](./references/usecase-workflows.md)
- [Async Tasks](./references/usecase-async-tasks.md)
- [Event Processing](./references/usecase-event-processing.md)
- [Microservice Orchestration](./references/usecase-microservice-orchestration.md)

### Operations
- [HTTP Invocation](./references/invoke-http.md)
- [Service Registration](./references/operate-registration.md)
- [Versioning](./references/operate-versioning.md)
- [Architecture](./references/architecture.md)
EOF
}

# Read template and replace placeholder
REFERENCES=$(generate_references)
sed "s|{{REFERENCES}}|${REFERENCES//$'\n'/\\n}|g" "$SKILL_TEMPLATE" > "$TMP_DIR/skill_temp.md"

# The sed replacement with newlines is tricky, use awk instead
awk -v refs="$REFERENCES" '{gsub(/\{\{REFERENCES\}\}/, refs); print}' "$SKILL_TEMPLATE" > "$SKILL_MD"

echo "    Generated: SKILL.md"

# -----------------------------------------------------------------------------
# Summary
# -----------------------------------------------------------------------------
echo ""
echo "==> Documentation sync complete!"
echo ""
echo "Fetched documentation:"
find "$REFS_DIR" -type f -name "*.md" | sort | while read -r f; do
    echo "    - ${f#$REFS_DIR/}"
done
echo ""
echo "Total files: $(find "$REFS_DIR" -type f -name "*.md" | wc -l)"
echo "Generated: $SKILL_MD"
