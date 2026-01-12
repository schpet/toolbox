# NAME

jj-split - Split a revision in two

# SYNOPSIS

**jj split** \[**-i**\|**\--interactive**\] \[**\--tool**\] \[**-r**\|**\--revision**\] \[**-o**\|**\--onto**\] \[**-A**\|**\--insert-after**\] \[**-B**\|**\--insert-before**\] \[**-m**\|**\--message**\] \[**\--editor**\] \[**-p**\|**\--parallel**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*FILESETS*\]

# DESCRIPTION

Split a revision in two

Starts a \[diff editor\] on the changes in the revision. Edit the right side of the diff until it has the content you want in the first commit. Once you close the editor, your revision will be split into two commits.

\[diff editor\]: https://docs.jj-vcs.dev/latest/config/#editing-diffs

By default, the selected changes stay in the original commit, and the remaining changes go into a new child commit:

\`\`\`text L L \| \| K (split) =\> K\" (remaining) \| \| J K (selected) \| J \`\`\`

With \`\--parallel/-p\`, the two parts become sibling commits instead of parent and child:

\`\`\`text L L / \\ \| K \| (selected) K (split) =\> \| K\" (remaining) \| \\ / J J \`\`\`

With \`-o\`, \`-A\`, or \`-B\`, the selected changes are extracted into a new commit at the specified location, while the remaining changes stay in place:

\`\`\`text M M \| \| L L \| \| K (split) =\> K (remaining, stays here) \| \| J J \| K\" (selected, inserted before J with -B J) \`\`\`

If the change you split had a description, you will be asked to enter a change description for each commit. If the change did not have a description, the second commit will not get a description, and you will be asked for a description only for the first commit.

Splitting an empty commit is not supported because the same effect can be achieved with \`jj new\`.

# OPTIONS

**-i**, **\--interactive**

:   Interactively choose which parts to split

    This is the default if no filesets are provided.

**\--tool** *\<NAME\>*

:   Specify diff editor to be used (implies \--interactive)

**-r**, **\--revision** *\<REVSET\>* \[default: @\]

:   The revision to split

**-o**, **\--onto** *\<REVSETS\>*

:   The revision(s) to rebase the selected changes onto (can be repeated to create a merge commit)

    Extracts the selected changes into a new commit based on the given revision(s). The remaining changes stay in the original commits location.

**-A**, **\--insert-after** *\<REVSETS\>*

:   The revision(s) to insert after (can be repeated to create a merge commit)

    Extracts the selected changes into a new commit inserted after the given revision(s). The remaining changes stay in the original commits location.

**-B**, **\--insert-before** *\<REVSETS\>*

:   The revision(s) to insert before (can be repeated to create a merge commit)

    Extracts the selected changes into a new commit inserted before the given revision(s). The remaining changes stay in the original commits location.

**-m**, **\--message** *\<MESSAGE\>*

:   The change description to use (dont open editor)

    Sets the description for the first commit (the one containing the selected changes). The second commit keeps the original description.

**\--editor**

:   Open an editor to edit the change description

    Forces an editor to open when using \`\--message\` to allow the message to be edited afterwards.

**-p**, **\--parallel**

:   Split the revision into two parallel revisions instead of a parent and child

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*FILESETS*\]

:   Files matching any of these filesets are put in the selected changes

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
