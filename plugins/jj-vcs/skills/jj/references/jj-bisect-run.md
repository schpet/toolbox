# NAME

jj-bisect-run - Run a given command to find the first bad revision

# SYNOPSIS

**jj bisect run** \<**-r**\|**\--range**\> \[**\--find-good**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*COMMAND*\] \[*ARGS*\]

# DESCRIPTION

Run a given command to find the first bad revision.

Uses binary search to find the first bad revision. Revisions are evaluated by running a given command (see the documentation for \`\--command\` for details).

It is assumed that if a given revision is bad, then all its descendants in the input range are also bad.

The target of the bisection can be inverted to look for the first good revision by passing \`\--find-good\`.

Hint: You can pass your shell as evaluation command. You can then run manual tests in the shell and make sure to exit the shell with appropriate error code depending on the outcome (e.g. \`exit 0\` to mark the revision as good in Bash or Fish).

Example: To run \`cargo test\` with the changes from revision \`xyz\` applied:

\`jj bisect run \--range v1.0..main \-- bash -c \"jj duplicate -r xyz -B @ && cargo test\"\`

# OPTIONS

**-r**, **\--range** *\<REVSETS\>*

:   Range of revisions to bisect

    This is typically a range like \`v1.0..main\`. The heads of the range are assumed to be bad. Ancestors of the range that are not also in the range are assumed to be good.

**\--find-good**

:   Whether to find the first good revision instead

    Inverts the interpretation of exit statuses (excluding special exit statuses).

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*COMMAND*\]

:   Command to run to determine whether the bug is present

    The exit status of the command will be used to mark revisions as good or bad: status 0 means good, 125 means to skip the revision, 127 (command not found) will abort the bisection, and any other non-zero exit status means the revision is bad.

    The targets commit ID is available to the command in the \`\$JJ_BISECT_TARGET\` environment variable.

\[*ARGS*\]

:   Arguments to pass to the command

    Hint: Use a \`\--\` separator to allow passing arguments starting with \`-\`. For example \`jj bisect run \--range=\... \-- test -f some-file\`.

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
