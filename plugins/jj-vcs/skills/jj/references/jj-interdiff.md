# NAME

jj-interdiff - Show differences between the diffs of two revisions

# SYNOPSIS

**jj interdiff** \[**-f**\|**\--from**\] \[**-t**\|**\--to**\] \[**-s**\|**\--summary**\] \[**\--stat**\] \[**\--types**\] \[**\--name-only**\] \[**\--git**\] \[**\--color-words**\] \[**\--tool**\] \[**\--context**\] \[**-w**\|**\--ignore-all-space**\] \[**-b**\|**\--ignore-space-change**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*FILESETS*\]

# DESCRIPTION

Show differences between the diffs of two revisions

This is like running \`jj diff -r\` on each change, then comparing those results. It answers: \"How do the modifications introduced by revision A differ from the modifications introduced by revision B?\"

For example, if two changes both add a feature but implement it differently, \`jj interdiff \--from @- \--to other\` shows what one implementation adds or removes that the other doesnt.

A common use of this command is to compare how a change has changed since the last push to a remote:

\`\`\`sh \$ jj interdiff \--from push-xyz@origin \--to push-xyz \`\`\`

This command is different from \`jj diff \--from A \--to B\`, which compares file contents directly. \`interdiff\` compares what the changes do in terms of their patches, rather than their file contents. This makes a difference when the two revisions have different parents: \`jj diff \--from A \--to B\` will include the changes between their parents while \`jj interdiff \--from A \--to B\` will not.

Technically, this works by rebasing \`\--from\` onto \`\--to\`s parents and comparing the result to \`\--to\`.

To see the changes throughout the whole evolution of a change instead of between just two revisions, use \`jj evolog -p instead\`.

# OPTIONS

**-f**, **\--from** *\<REVSET\>*

:   The first revision to compare (default: @)

**-t**, **\--to** *\<REVSET\>*

:   The second revision to compare (default: @)

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*FILESETS*\]

:   Restrict the diff to these paths

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

**-w**, **\--ignore-all-space**

:   Ignore whitespace when comparing lines

**-b**, **\--ignore-space-change**

:   Ignore changes in amount of whitespace when comparing lines

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
