# NAME

jj-log - Show revision history

# SYNOPSIS

**jj log** \[**-r**\|**\--revisions**\] \[**-n**\|**\--limit**\] \[**\--reversed**\] \[**-G**\|**\--no-graph**\] \[**-T**\|**\--template**\] \[**-p**\|**\--patch**\] \[**\--count**\] \[**-s**\|**\--summary**\] \[**\--stat**\] \[**\--types**\] \[**\--name-only**\] \[**\--git**\] \[**\--color-words**\] \[**\--tool**\] \[**\--context**\] \[**\--ignore-all-space**\] \[**\--ignore-space-change**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*FILESETS*\]

# DESCRIPTION

Show revision history

Renders a graphical view of the projects history, ordered with children before parents. By default, the output only includes mutable revisions, along with some additional revisions for context. Use \`jj log -r ::\` to see all revisions. See \[\`jj help -k revsets\`\] for information about the syntax.

\[\`jj help -k revsets\`\]: https://docs.jj-vcs.dev/latest/revsets/

Spans of revisions that are not included in the graph per \`\--revisions\` are rendered as a synthetic node labeled \"(elided revisions)\".

The working-copy commit is indicated by a \`@\` symbol in the graph. \[Immutable revisions\] have a \`◆\` symbol. Other commits have a \`○\` symbol. All of these symbols can be \[customized\].

\[Immutable revisions\]: https://docs.jj-vcs.dev/latest/config/#set-of-immutable-commits

\[customized\]: https://docs.jj-vcs.dev/latest/config/#node-style

# OPTIONS

**-r**, **\--revisions** *\<REVSETS\>*

:   Which revisions to show

    If no paths nor revisions are specified, this defaults to the \`revsets.log\` setting.

**-n**, **\--limit** *\<LIMIT\>*

:   Limit number of revisions to show

    Applied after revisions are filtered and reordered topologically, but before being reversed.

**\--reversed**

:   Show revisions in the opposite order (older revisions first)

**-G**, **\--no-graph**

:   Dont show the graph, show a flat list of revisions

**-T**, **\--template** *\<TEMPLATE\>*

:   Render each revision using the given template

    Run \`jj log -T\` to list the built-in templates.

    You can also specify arbitrary template expressions using the \[built-in keywords\]. See \[\`jj help -k templates\`\] for more information.

    If not specified, this defaults to the \`templates.log\` setting.

    \[built-in keywords\]: https://docs.jj-vcs.dev/latest/templates/#commit-keywords

    \[\`jj help -k templates\`\]: https://docs.jj-vcs.dev/latest/templates/

**-p**, **\--patch**

:   Show patch

**\--count**

:   Print the number of commits instead of showing them

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*FILESETS*\]

:   Show revisions modifying the given paths

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
