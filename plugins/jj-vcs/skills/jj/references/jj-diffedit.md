# NAME

jj-diffedit - Touch up the content changes in a revision with a diff editor

# SYNOPSIS

**jj diffedit** \[**-r**\|**\--revision**\] \[**-f**\|**\--from**\] \[**-t**\|**\--to**\] \[**\--tool**\] \[**\--restore-descendants**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*FILESETS*\]

# DESCRIPTION

Touch up the content changes in a revision with a diff editor

With the \`-r\` option, starts a \[diff editor\] on the changes in the revision.

With the \`\--from\` and/or \`\--to\` options, starts a \[diff editor\] comparing the \"from\" revision to the \"to\" revision.

\[diff editor\]: https://docs.jj-vcs.dev/latest/config/#editing-diffs

Edit the right side of the diff until it looks the way you want. Once you close the editor, the revision specified with \`-r\` or \`\--to\` will be updated. Unless \`\--restore-descendants\` is used, descendants will be rebased on top as usual, which may result in conflicts.

See \`jj restore\` if you want to move entire files from one revision to another. For moving changes between revisions, see \`jj squash -i\`.

# OPTIONS

**-r**, **\--revision** *\<REVSET\>*

:   The revision to touch up

    Defaults to @ if neither \--to nor \--from are specified.

**-f**, **\--from** *\<REVSET\>*

:   Show changes from this revision

    Defaults to @ if \--to is specified.

**-t**, **\--to** *\<REVSET\>*

:   Edit changes in this revision

    Defaults to @ if \--from is specified.

**\--tool** *\<NAME\>*

:   Specify diff editor to be used

**\--restore-descendants**

:   Preserve the content (not the diff) when rebasing descendants

    When rebasing a descendant on top of the rewritten revision, its diff compared to its parent(s) is normally preserved, i.e. the same way that descendants are always rebased. This flag makes it so the content/state is preserved instead of preserving the diff.

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*FILESETS*\]

:   Edit only these paths (unmatched paths will remain unchanged)

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
