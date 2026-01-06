# NAME

jj-evolog - Show how a change has evolved over time

# SYNOPSIS

**jj evolog** \[**-r**\|**\--revisions**\] \[**-n**\|**\--limit**\] \[**\--reversed**\] \[**-G**\|**\--no-graph**\] \[**-T**\|**\--template**\] \[**-p**\|**\--patch**\] \[**-s**\|**\--summary**\] \[**\--stat**\] \[**\--types**\] \[**\--name-only**\] \[**\--git**\] \[**\--color-words**\] \[**\--tool**\] \[**\--context**\] \[**\--ignore-all-space**\] \[**\--ignore-space-change**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\]

# DESCRIPTION

Show how a change has evolved over time

Lists the previous commits which a change has pointed to. The current commit of a change evolves when the change is updated, rebased, etc.

# OPTIONS

**-r**, **\--revisions** *\<REVSETS\>* \[default: @\]

:   Follow changes from these revisions

**-n**, **\--limit** *\<LIMIT\>*

:   Limit number of revisions to show

    Applied after revisions are reordered topologically, but before being reversed.

**\--reversed**

:   Show revisions in the opposite order (older revisions first)

**-G**, **\--no-graph**

:   Dont show the graph, show a flat list of revisions

**-T**, **\--template** *\<TEMPLATE\>*

:   Render each revision using the given template

    All 0-argument methods of the \[\`CommitEvolutionEntry\` type\] are available as keywords in the template expression. See \[\`jj help -k templates\`\] for more information.

    If not specified, this defaults to the \`templates.evolog\` setting.

    \[\`CommitEvolutionEntry\` type\]: https://docs.jj-vcs.dev/latest/templates/#commitevolutionentry-type

    \[\`jj help -k templates\`\]: https://docs.jj-vcs.dev/latest/templates/

**-p**, **\--patch**

:   Show patch compared to the previous version of this change

    If the previous version has different parents, it will be temporarily rebased to the parents of the new version, so the diff is not contaminated by unrelated changes.

**-h**, **\--help**

:   Print help (see a summary with -h)

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
