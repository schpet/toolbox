# https://just.systems

default:
    @just -l -u

# Generate jj skill documentation from manpages
generate-jj-docs:
    deno run --allow-run --allow-read --allow-write plugins/jj-vcs/scripts/generate-jj-docs.ts

# Remove local plugin installation
claude-remove-local:
    -claude plugin remove jj-vcs@toolbox
    -claude plugin remove changelog@toolbox
    -claude plugin remove svbump@toolbox
    -claude plugin remove chores@toolbox
    -claude plugin remove speccer@toolbox
    -claude plugin marketplace remove toolbox

# Install plugin from local directory
claude-install-local:
    claude plugin marketplace add ./
    claude plugin install jj-vcs@toolbox
    claude plugin install changelog@toolbox
    claude plugin install svbump@toolbox
    claude plugin install chores@toolbox
    claude plugin install speccer@toolbox

# Update plugins (reinstall)
claude-update:
    claude plugin install jj-vcs@toolbox
    claude plugin install changelog@toolbox
    claude plugin install svbump@toolbox
    claude plugin install chores@toolbox
    claude plugin install speccer@toolbox

# Bump all plugin versions to latest changelog version
bump-versions:
    #!/usr/bin/env bash
    set -euo pipefail
    VERSION=$(changelog version latest)
    echo "Bumping all versions to: $VERSION"
    svbump write "$VERSION" version .claude-plugin/marketplace.json
    jq --arg v "$VERSION" '.plugins |= map(.version = $v)' .claude-plugin/marketplace.json > .claude-plugin/marketplace.json.tmp && mv .claude-plugin/marketplace.json.tmp .claude-plugin/marketplace.json
    for plugin_json in plugins/*/.claude-plugin/plugin.json; do
        svbump write "$VERSION" version "$plugin_json"
    done
    echo "Done!"

# Install plugins from GitHub
claude-install-github:
    claude plugin marketplace add schpet/toolbox
    claude plugin install jj-vcs@toolbox
    claude plugin install changelog@toolbox
    claude plugin install svbump@toolbox
    claude plugin install chores@toolbox
    claude plugin install speccer@toolbox

# Symlink plugins to cache for dev (changes picked up on restart, no reinstall)
claude-symlink-dev:
    #!/usr/bin/env bash
    set -euo pipefail
    VERSION=$(changelog version latest)
    CACHE_DIR="$HOME/.claude/plugins/cache/toolbox"
    PLUGINS_DIR="$(pwd)/plugins"
    rm -rf "$CACHE_DIR"
    for plugin in changelog chores jj-vcs svbump speccer; do
        mkdir -p "$CACHE_DIR/$plugin"
        ln -s "$PLUGINS_DIR/$plugin" "$CACHE_DIR/$plugin/$VERSION"
        echo "Symlinked $plugin -> $VERSION"
    done
    echo "Done! Restart Claude to pick up changes."
