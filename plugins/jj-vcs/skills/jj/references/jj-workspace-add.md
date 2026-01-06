# NAME

jj-workspace-add - Add a workspace

# SYNOPSIS

**jj workspace add** \[**\--name**\] \[**-r**\|**\--revision**\] \[**\--sparse-patterns**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \<*DESTINATION*\>

# DESCRIPTION

Add a workspace

By default, the new workspace inherits the sparse patterns of the current workspace. You can override this with the \`\--sparse-patterns\` option.

# OPTIONS

**\--name** *\<NAME\>*

:   A name for the workspace

    To override the default, which is the basename of the destination directory.

**-r**, **\--revision** *\<REVSETS\>*

:   A list of parent revisions for the working-copy commit of the newly created workspace. You may specify nothing, or any number of parents.

    If no revisions are specified, the new workspace will be created, and its working-copy commit will exist on top of the parent(s) of the working-copy commit in the current workspace, i.e. they will share the same parent(s).

    If any revisions are specified, the new workspace will be created, and the new working-copy commit will be created with all these revisions as parents, i.e. the working-copy commit will exist as if you had run \`jj new r1 r2 r3 \...\`.

**\--sparse-patterns** *\<SPARSE_PATTERNS\>* \[default: copy\]

:   How to handle sparse patterns when creating a new workspace\

    \
    *Possible values:*

    - copy: Copy all sparse patterns from the current workspace

    - full: Include all files in the new workspace

    - empty: Clear all files from the workspace (it will be empty)

**-h**, **\--help**

:   Print help (see a summary with -h)

\<*DESTINATION*\>

:   Where to create the new workspace

# GLOBAL OPTIONS

**-R**, **\--repository** *\<REPOSITORY\>*

:   Path to repository to operate on

    By default, Jujutsu searches for the closest .jj/ directory in an ancestor of the current working directory.

**\--ignore-working-copy**

:   Dont snapshot the working copy, and dont update it

    By default, Jujutsu snapshots the working copy at the beginning of every command. The working copy is also updated at the end of the command, if the command modified the working-copy commit (\`@\`). If you want to avoid snapshotting the working copy and instead see a possibly stale working-copy commit, you can use \`\--ignore-working-copy\`. This may be useful e.g. in a command prompt, especially if you have another process that commits the working copy.

    Loading the repository at a specific operation with \`\--at-operation\` implies \`\--ignore-working-copy\`.

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
    \[*possible values:* always, never, debug, auto\]

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
