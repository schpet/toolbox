# NAME

jj-metaedit - Modify the metadata of a revision without changing its content

# SYNOPSIS

**jj metaedit** \[**\--update-change-id**\] \[**-m**\|**\--message**\] \[**\--update-author-timestamp**\] \[**\--update-author**\] \[**\--author**\] \[**\--author-timestamp**\] \[**\--force-rewrite**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*REVSETS*\]

# DESCRIPTION

Modify the metadata of a revision without changing its content

Whenever any metadata is updated, the committer name, email, and timestamp are also updated for all rebased commits. The name and email may come from the \`JJ_USER\` and \`JJ_EMAIL\` environment variables, as well as by passing \`\--config user.name\` and \`\--config user.email\`.

# OPTIONS

**\--update-change-id**

:   Generate a new change-id

    This generates a new change-id for the revision.

**-m**, **\--message** *\<MESSAGE\>*

:   Update the change description

    This updates the change description, without opening the editor.

    Use \`jj describe\` if you want to use an editor.

**\--update-author-timestamp**

:   Update the author timestamp

    This updates the author date to the current time, without modifying the author.

**\--update-author**

:   Update the author to the configured user

    This updates the author name and email. The author timestamp is not modified -- use \--update-author-timestamp to update the author timestamp.

    You can use it in combination with the JJ_USER and JJ_EMAIL environment variables to set a different author:

    \$ JJ_USER=Foo Bar JJ_EMAIL=foo@bar.com jj metaedit \--update-author

**\--author** *\<AUTHOR\>*

:   Set author to the provided string

    This changes author name and email while retaining author timestamp for non-discardable commits.

**\--author-timestamp** *\<AUTHOR_TIMESTAMP\>*

:   Set the author date to the given date either human readable, eg Sun, 23 Jan 2000 01:23:45 JST) or as a time stamp, eg 2000-01-23T01:23:45+09:00)

**\--force-rewrite**

:   Rewrite the commit, even if no other metadata changed

    This updates the committer timestamp to the current time, as well as the committer name and email.

    Even if this option is not passed, the committer name, email, and timestamp will be updated if other metadata is updated. This option just forces every commit to be rewritten whether or not there are other changes.

    You can use it in combination with the \`JJ_USER\` and \`JJ_EMAIL\` environment variables to set a different committer:

    \$ JJ_USER=Foo Bar JJ_EMAIL=foo@bar.com jj metaedit \--force-rewrite

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*REVSETS*\]

:   The revision(s) to modify (default: @)

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
