# https://just.systems

default:
    @just -l -u

# Generate jj skill documentation from manpages
generate-jj-docs:
    deno run --allow-run --allow-read --allow-write plugins/jj-vcs/scripts/generate-jj-docs.ts

# Remove local plugin installation
claude-remove-local:
    -claude plugin remove jj-vcs@toolbox
    -claude plugin marketplace remove toolbox

# Install plugin from local directory
claude-install-local:
    claude plugin marketplace add ./
    claude plugin install jj-vcs@toolbox

# Update plugin (reinstall)
claude-update:
    claude plugin install jj-vcs@toolbox

# Install plugin from GitHub
claude-install-github:
    claude plugin marketplace add schpet/toolbox
    claude plugin install jj-vcs@toolbox
