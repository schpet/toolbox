# NAME

jj - Jujutsu (An experimental VCS)

# SYNOPSIS

**jj** \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[**-V**\|**\--version**\] \[*subcommands*\]

# DESCRIPTION

Jujutsu (An experimental VCS)

To get started, see the tutorial \[\`jj help -k tutorial\`\].

\[\`jj help -k tutorial\`\]: https://docs.jj-vcs.dev/latest/tutorial/

# OPTIONS

**-h**, **\--help**

:   Print help (see a summary with -h)

**-V**, **\--version**

:   Print version

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

# SUBCOMMANDS

jj-abandon(1)

:   Abandon a revision

jj-absorb(1)

:   Move changes from a revision into the stack of mutable revisions

jj-bisect(1)

:   Find a bad revision by bisection

jj-bookmark(1)

:   Manage bookmarks \[default alias: b\]

jj-commit(1)

:   Update the description and create a new change on top \[default alias: ci\]

jj-config(1)

:   Manage config options

jj-describe(1)

:   Update the change description or other metadata \[default alias: desc\]

jj-diff(1)

:   Compare file contents between two revisions

jj-diffedit(1)

:   Touch up the content changes in a revision with a diff editor

jj-duplicate(1)

:   Create new changes with the same content as existing ones

jj-edit(1)

:   Sets the specified revision as the working-copy revision

jj-evolog(1)

:   Show how a change has evolved over time

jj-file(1)

:   File operations

jj-fix(1)

:   Update files with formatting fixes or other changes

jj-gerrit(1)

:   Interact with Gerrit Code Review

jj-git(1)

:   Commands for working with Git remotes and the underlying Git repo

jj-help(1)

:   Print this message or the help of the given subcommand(s)

jj-interdiff(1)

:   Compare the changes of two commits

jj-log(1)

:   Show revision history

jj-metaedit(1)

:   Modify the metadata of a revision without changing its content

jj-new(1)

:   Create a new, empty change and (by default) edit it in the working copy

jj-next(1)

:   Move the working-copy commit to the child revision

jj-operation(1)

:   Commands for working with the operation log

jj-parallelize(1)

:   Parallelize revisions by making them siblings

jj-prev(1)

:   Change the working copy revision relative to the parent revision

jj-rebase(1)

:   Move revisions to different parent(s)

jj-redo(1)

:   Redo the most recently undone operation

jj-resolve(1)

:   Resolve conflicted files with an external merge tool

jj-restore(1)

:   Restore paths from another revision

jj-revert(1)

:   Apply the reverse of the given revision(s)

jj-root(1)

:   Show the current workspace root directory (shortcut for \`jj workspace root\`)

jj-show(1)

:   Show commit description and changes in a revision

jj-sign(1)

:   Cryptographically sign a revision

jj-simplify-parents(1)

:   Simplify parent edges for the specified revision(s)

jj-sparse(1)

:   Manage which paths from the working-copy commit are present in the working copy

jj-split(1)

:   Split a revision in two

jj-squash(1)

:   Move changes from a revision into another revision

jj-status(1)

:   Show high-level repo status \[default alias: st\]

jj-tag(1)

:   Manage tags

jj-undo(1)

:   Undo the last operation

jj-unsign(1)

:   Drop a cryptographic signature

jj-util(1)

:   Infrequently used commands such as for generating shell completions

jj-version(1)

:   Display version information

jj-workspace(1)

:   Commands for working with workspaces

# EXTRA

jj help \--help lists available keywords. Use jj help -k to show help for one of these keywords.

# VERSION

v0.36.0
