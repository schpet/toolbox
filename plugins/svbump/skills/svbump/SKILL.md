---
name: svbump
description: Read and write semantic versions in config files (JSON, TOML, YAML). This skill should be used when bumping versions in package.json, Cargo.toml, deno.json, or other config files, or when reading version values from these files.
---

# svbump

A CLI tool for bumping semantic versions in various config file formats.

## Supported Formats

- JSON (package.json, deno.json, etc.)
- TOML (Cargo.toml, pyproject.toml, etc.)
- YAML (app.yaml, etc.)

## Commands

### Read Version

Print the current version to stdout:

```
svbump read <SELECTOR> <FILE>
```

**Examples:**
```sh
svbump read version package.json
svbump read package.version Cargo.toml
svbump read version deno.json
```

### Write Version

Modify the version in a file:

```
svbump write <LEVEL> <SELECTOR> <FILE>
```

**Level options:**
- `major` - Bump major version (1.0.0 -> 2.0.0)
- `minor` - Bump minor version (1.0.0 -> 1.1.0)
- `patch` - Bump patch version (1.0.0 -> 1.0.1)
- `X.Y.Z` - Set specific version (must be higher than current)

**Examples:**
```sh
# Bump patch version
svbump write patch version package.json

# Bump minor version in nested field
svbump write minor package.version Cargo.toml

# Set specific version
svbump write 2.5.0 version package.json

# Copy version from one file to another
svbump write "$(svbump read version deno.json)" package.version dist-workspace.toml
```

### Preview Version

Preview what a bump would do without modifying the file:

```
svbump preview <LEVEL> <SELECTOR> <FILE>
```

**Example:**
```sh
svbump preview minor version package.json
# Outputs: 1.1.0 (without modifying the file)
```

## Selector Syntax

Use dot notation to access nested fields:

- `version` - Top-level version field
- `package.version` - Nested under `[package]` table in TOML
- `dependencies.foo.version` - Deeply nested field

## Common Workflows

### Release workflow with changelog

```sh
# Set version from changelog's latest release
svbump write "$(changelog version latest)" version deno.json

# Sync version to other config files
svbump write "$(svbump read version deno.json)" package.version dist-workspace.toml
```

### Force file type

Use `-t` or `--type` to override file type detection:

```sh
svbump read version config -t json
svbump write patch version config --type toml
```
