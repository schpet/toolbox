# NAME

jj-restore - Restore paths from another revision

# SYNOPSIS

**jj restore** \[**-f**\|**\--from**\] \[**-t**\|**\--into**\] \[**-c**\|**\--changes-in**\] \[**-i**\|**\--interactive**\] \[**\--tool**\] \[**\--restore-descendants**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*FILESETS*\]

# DESCRIPTION

Restore paths from another revision

That means that the paths get the same content in the destination (\`\--into\`) as they had in the source (\`\--from\`). This is typically used for undoing changes to some paths in the working copy (\`jj restore \<paths\>\`).

If only one of \`\--from\` or \`\--into\` is specified, the other one defaults to the working copy.

When neither \`\--from\` nor \`\--into\` is specified, the command restores into the working copy from its parent(s). \`jj restore\` without arguments is similar to \`jj abandon\`, except that it leaves an empty revision with its description and other metadata preserved.

See \`jj diffedit\` if youd like to restore portions of files rather than entire files.

# OPTIONS

**-f**, **\--from** *\<REVSET\>*

:   Revision to restore from (source)

**-t**, **\--into** *\<REVSET\>*

:   Revision to restore into (destination)

**-c**, **\--changes-in** *\<REVSET\>*

:   Undo the changes in a revision as compared to the merge of its parents.

    This undoes the changes that can be seen with \`jj diff -r REVSET\`. If \`REVSET\` only has a single parent, this option is equivalent to \`jj restore \--into REVSET \--from REVSET-\`.

    The default behavior of \`jj restore\` is equivalent to \`jj restore \--changes-in @\`.

**-i**, **\--interactive**

:   Interactively choose which parts to restore

**\--tool** *\<NAME\>*

:   Specify diff editor to be used (implies \--interactive)

**\--restore-descendants**

:   Preserve the content (not the diff) when rebasing descendants

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*FILESETS*\]

:   Restore only these paths (instead of all paths)

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
