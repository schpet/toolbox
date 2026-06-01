# NAME

jj-config-list - List variables set in config files, along with their values

# SYNOPSIS

**jj config list** \[**\--include-defaults**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--include-overridden**\] \[**\--no-integrate-operation**\] \[**\--user**\] \[**\--ignore-immutable**\] \[**\--repo**\] \[**\--at-operation**\] \[**\--workspace**\] \[**\--debug**\] \[**-T**\|**\--template**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*NAME*\]

# DESCRIPTION

List variables set in config files, along with their values

# OPTIONS

**\--include-defaults**

:   Whether to explicitly include built-in default values in the list

**\--include-overridden**

:   Allow printing overridden values

**\--user**

:   Target the user-level config

**\--repo**

:   Target the repo-level config

**\--workspace**

:   Target the workspace-level config

**-T**, **\--template** *\<TEMPLATE\>*

:   Render each variable using the given template

    The following keywords are available in the template expression:

    \* \`name: String\`: Config name, in \[TOMLs \"dotted key\" format\]. \* \`value: ConfigValue\`: Value to be formatted in TOML syntax. \* \`overridden: Boolean\`: True if the value is shadowed by other. \* \`source: String\`: Source of the value. \* \`path: String\`: Path to the config file.

    Can be overridden by the \`templates.config_list\` setting. To see a detailed config list, use the \`builtin_config_list_detailed\` template.

    See \[\`jj help -k templates\`\] for more information.

    \[TOMLs \"dotted key\" format\]: https://toml.io/en/v1.0.0#keys

    \[\`jj help -k templates\`\]: https://docs.jj-vcs.dev/latest/templates/

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*NAME*\]

:   An optional name of a specific config option to look up

# GLOBAL OPTIONS

**-R**, **\--repository** *\<REPOSITORY\>*

:   Path to repository to operate on

    By default, Jujutsu searches for the closest .jj/ directory in an ancestor of the current working directory.

**\--ignore-working-copy**

:   Dont snapshot the working copy, and dont update it

    By default, Jujutsu snapshots the working copy at the beginning of every command. The working copy is also updated at the end of the command, if the command modified the working-copy commit (\`@\`). If you want to avoid snapshotting the working copy and instead see a possibly stale working-copy commit, you can use \`\--ignore-working-copy\`. This may be useful e.g. in a command prompt, especially if you have another process that commits the working copy.

    Loading the repository at a specific operation with \`\--at-operation\` implies \`\--ignore-working-copy\`.

**\--no-integrate-operation**

:   Run the command as usual but dont integrate any operations

    When this option is given, the operations will still be created as usual but they will not be integrated to the operation log. The working copy will also not be updated.

    The command will print the resulting operation ID. You can pass that to e.g. \`jj \--at-op\` to inspect the resulting repo state, or you can pass it to \`jj op restore\` to restore the repo to that state. You can also pass the ID to \`jj op integrate\` to integrate the operation.

    Note that this does \*not\* prevent side effects outside the repo. For example, \`jj git push \--no-integrate-operation\` will still perform the push.

**\--ignore-immutable**

:   Allow rewriting immutable commits

    By default, Jujutsu prevents rewriting commits in the configured set of immutable commits. This option disables that check and lets you rewrite any commit but the root commit.

    This option only affects the check. It does not affect the \`immutable_heads()\` revset or the \`immutable\` template keyword.

**\--at-operation** *\<AT_OPERATION\>*

:   Operation to load the repo at

    Operation to load the repo at. By default, Jujutsu loads the repo at the most recent operation, or at the merge of the divergent operations if any.

    You can use \`\--at-op=\<operation ID\>\` to see what the repo looked like at an earlier operation. For example \`jj \--at-op=\<operation ID\> st\` will show you what \`jj st\` would have shown you when the given operation had just finished. \`\--at-op=@\` is pretty much the same as the default except that divergent operations will never be merged.

    Use \`jj op log\` to find the operation ID you want. Any unambiguous prefix of the operation ID is enough.

    When loading the repo at an earlier operation, the working copy will be ignored, as if \`\--ignore-working-copy\` had been specified.

    It is possible to run mutating commands when loading the repo at an earlier operation. Doing that is equivalent to having run concurrent commands starting at the earlier operation. Theres rarely a reason to do that, but it is possible.

**\--debug**

:   Enable debug logging

**\--color** *\<WHEN\>*

:   When to colorize output\

    \
    *Possible values:*

    - always

    - never

    - debug

    - auto

**\--quiet**

:   Silence non-primary command output

    For example, \`jj file list\` will still list files, but it wont tell you if the working copy was snapshotted or if descendants were rebased.

    Warnings and errors will still be printed.

**\--no-pager**

:   Disable the pager

**\--config** *\<NAME=VALUE\>*

:   Additional configuration options (can be repeated)

    The name should be specified as TOML dotted keys. The value should be specified as a TOML expression. If string value isnt enclosed by any TOML constructs (such as array notation), quotes can be omitted.

**\--config-file** *\<PATH\>*

:   Additional configuration files (can be repeated)
