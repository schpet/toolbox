# NAME

jj-operation-show - Show changes to the repository in an operation

# SYNOPSIS

**jj operation show** \[**-G**\|**\--no-graph**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**-T**\|**\--template**\] \[**\--no-integrate-operation**\] \[**-p**\|**\--patch**\] \[**\--ignore-immutable**\] \[**\--no-op-diff**\] \[**\--at-operation**\] \[**-s**\|**\--summary**\] \[**\--debug**\] \[**\--stat**\] \[**\--color**\] \[**\--types**\] \[**\--name-only**\] \[**\--quiet**\] \[**\--git**\] \[**\--no-pager**\] \[**\--color-words**\] \[**\--config**\] \[**\--config-file**\] \[**\--tool**\] \[**\--context**\] \[**\--ignore-all-space**\] \[**\--ignore-space-change**\] \[**\--show-changes-in**\] \[**-h**\|**\--help**\] \[*OPERATION*\]

# DESCRIPTION

Show changes to the repository in an operation

# OPTIONS

**-G**, **\--no-graph**

:   Dont show the graph, show a flat list of modified changes

**-T**, **\--template** *\<TEMPLATE\>*

:   Render the operation using the given template

    You can specify arbitrary template expressions using the \[built-in keywords\]. See \[\`jj help -k templates\`\] for more information.

    \[built-in keywords\]: https://docs.jj-vcs.dev/latest/templates/#operation-keywords

    \[\`jj help -k templates\`\]: https://docs.jj-vcs.dev/latest/templates/

**-p**, **\--patch**

:   Show patch of modifications to changes

    If the previous version has different parents, it will be temporarily rebased to the parents of the new version, so the diff is not contaminated by unrelated changes.

**\--no-op-diff**

:   Do not show operation diff

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*OPERATION*\] \[default: @\]

:   Show repository changes in this operation, compared to its parent(s)

# DIFF FORMATTING OPTIONS

**-s**, **\--summary**

:   For each path, show only whether it was modified, added, or deleted

**\--stat**

:   Show a histogram of the changes

**\--types**

:   For each path, show only its type before and after

    The diff is shown as two letters. The first letter indicates the type before and the second letter indicates the type after. - indicates that the path was not present, F represents a regular file, \`L represents a symlink, C represents a conflict, and G represents a Git submodule.

**\--name-only**

:   For each path, show only its path

    Typically useful for shell commands like: \`jj diff -r @- \--name-only \| xargs perl -pi -es/OLD/NEW/g\`

**\--git**

:   Show a Git-format diff

**\--color-words**

:   Show a word-level diff with changes indicated only by color

**\--tool** *\<TOOL\>*

:   Generate diff by external command

    A builtin format can also be specified as \`:\<name\>\`. For example, \`\--tool=:git\` is equivalent to \`\--git\`.

**\--context** *\<CONTEXT\>*

:   Number of lines of context to show

**\--ignore-all-space**

:   Ignore whitespace when comparing lines

**\--ignore-space-change**

:   Ignore changes in amount of whitespace when comparing lines

**\--show-changes-in** *\<REVSETS\>*

:   Show only changed revisions matching the given revset expression

    If no revisions are specified, this defaults to the \`revsets.op-diff-changes-in\` setting.

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
