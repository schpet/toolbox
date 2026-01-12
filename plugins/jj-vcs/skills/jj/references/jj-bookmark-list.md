# NAME

jj-bookmark-list - List bookmarks and their targets

# SYNOPSIS

**jj bookmark list** \[**-a**\|**\--all-remotes**\] \[**\--remote**\] \[**-t**\|**\--tracked**\] \[**-c**\|**\--conflicted**\] \[**-r**\|**\--revisions**\] \[**-T**\|**\--template**\] \[**\--sort**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*NAMES*\]

# DESCRIPTION

List bookmarks and their targets

By default, a tracked remote bookmark will be included only if its target is different from the local target. An untracked remote bookmark wont be listed. For a conflicted bookmark (both local and remote), old target revisions are preceded by a \"-\" and new target revisions are preceded by a \"+\".

See \[\`jj help -k bookmarks\`\] for more information.

\[\`jj help -k bookmarks\`\]: https://docs.jj-vcs.dev/latest/bookmarks

# OPTIONS

**-a**, **\--all-remotes**

:   Show all tracked and untracked remote bookmarks including the ones whose targets are synchronized with the local bookmarks

**\--remote** *\<REMOTE\>*

:   Show all tracked and untracked remote bookmarks belonging to this remote

    Can be combined with \`\--tracked\` or \`\--conflicted\` to filter the bookmarks shown (can be repeated.)

    By default, the specified pattern matches remote names with glob syntax. You can also use other \[string pattern syntax\].

    \[string pattern syntax\]: https://docs.jj-vcs.dev/latest/revsets/#string-patterns

**-t**, **\--tracked**

:   Show tracked remote bookmarks only

    This omits local Git-tracking bookmarks by default.

**-c**, **\--conflicted**

:   Show conflicted bookmarks only

**-r**, **\--revisions** *\<REVSETS\>*

:   Show bookmarks whose local targets are in the given revisions

    Note that \`-r deleted_bookmark\` will not work since \`deleted_bookmark\` wouldnt have a local target.

**-T**, **\--template** *\<TEMPLATE\>*

:   Render each bookmark using the given template

    All 0-argument methods of the \[\`CommitRef\` type\] are available as keywords in the template expression. See \[\`jj help -k templates\`\] for more information.

    \[\`CommitRef\` type\]: https://docs.jj-vcs.dev/latest/templates/#commitref-type

    \[\`jj help -k templates\`\]: https://docs.jj-vcs.dev/latest/templates/

**\--sort** *\<SORT_KEY\>*

:   Sort bookmarks based on the given key (or multiple keys)

    Suffix the key with \`-\` to sort in descending order of the value (e.g. \`\--sort name-\`). Note that when using multiple keys, the first key is the most significant.

    This defaults to the \`ui.bookmark-list-sort-keys\` setting.\

    \
    \[*possible values:* name, name-, author-name, author-name-, author-email, author-email-, author-date, author-date-, committer-name, committer-name-, committer-email, committer-email-, committer-date, committer-date-\]

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*NAMES*\]

:   Show bookmarks whose local name matches

    By default, the specified pattern matches bookmark names with glob syntax. You can also use other \[string pattern syntax\].

    \[string pattern syntax\]: https://docs.jj-vcs.dev/latest/revsets/#string-patterns

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
