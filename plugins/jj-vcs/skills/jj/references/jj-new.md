# NAME

jj-new - Create a new, empty change and (by default) edit it in the working copy

# SYNOPSIS

**jj new** \[**-m**\|**\--message**\] \[**\--no-edit**\] \[**-A**\|**\--insert-after**\] \[**-B**\|**\--insert-before**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*REVSETS*\]

# DESCRIPTION

Create a new, empty change and (by default) edit it in the working copy

By default, \`jj\` will edit the new change, making the \[working copy\] represent the new commit. This can be avoided with \`\--no-edit\`.

Note that you can create a merge commit by specifying multiple revisions as argument. For example, \`jj new @ main\` will create a new commit with the working copy and the \`main\` bookmark as parents.

\[working copy\]: https://docs.jj-vcs.dev/latest/working-copy/

# OPTIONS

**-m**, **\--message** *\<MESSAGE\>*

:   The change description to use

**\--no-edit**

:   Do not edit the newly created change

**-A**, **\--insert-after** *\<REVSETS\>*

:   Insert the new change after the given commit(s)

    Example: \`jj new \--insert-after A\` creates a new change between \`A\` and its children:

    \`\`\`text B C \\ / B C =\> @ \\ / \| A A \`\`\`

    Specifying \`\--insert-after\` multiple times will relocate all children of the given commits.

    Example: \`jj new \--insert-after A \--insert-after X\` creates a change with \`A\` and \`X\` as parents, and rebases all children on top of the new change:

    \`\`\`text B Y \\ / B Y =\> @ \| \| / \\ A X A X \`\`\`

**-B**, **\--insert-before** *\<REVSETS\>*

:   Insert the new change before the given commit(s)

    Example: \`jj new \--insert-before C\` creates a new change between \`C\` and its parents:

    \`\`\`text C \| C =\> @ / \\ / \\ A B A B \`\`\`

    \`\--insert-after\` and \`\--insert-before\` can be combined.

    Example: \`jj new \--insert-after A \--insert-before D\`:

    \`\`\`text

    D D \| / \\ C \| C \| =\> @ \| B \| B \| \\ / A A \`\`\`

    Similar to \`\--insert-after\`, you can specify \`\--insert-before\` multiple times.

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*REVSETS*\] \[default: @\]

:   Parent(s) of the new change

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
