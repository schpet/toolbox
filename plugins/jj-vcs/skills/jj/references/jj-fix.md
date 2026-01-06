# NAME

jj-fix - Update files with formatting fixes or other changes

# SYNOPSIS

**jj fix** \[**-s**\|**\--source**\] \[**\--include-unchanged-files**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*FILESETS*\]

# DESCRIPTION

Update files with formatting fixes or other changes

The primary use case for this command is to apply the results of automatic code formatting tools to revisions that may not be properly formatted yet. It can also be used to modify files with other tools like \`sed\` or \`sort\`.

\### How it works

The changed files in the given revisions will be updated with any fixes determined by passing their file content through any external tools the user has configured for those files. Descendants will also be updated by passing their versions of the same files through the same tools, which will ensure that the fixes are not lost. This will never result in new conflicts. Files with existing conflicts will be updated on all sides of the conflict, which can potentially increase or decrease the number of conflict markers.

\### Configuration

See \`jj help -k config\` chapter \`Code formatting and other file content transformations\` to understand how to configure your tools.

\### Execution Example

Lets consider the following configuration is set. We have two code formatters (\`clang-format\` and \`black\`), which apply to three different file extensions (\`.cc\`, \`.h\`, and \`.py\`):

\`\`\`toml \[fix.tools.clang-format\] command = \[\"/usr/bin/clang-format\", \"\--assume-filename=\$path\"\] patterns = \[\"glob:\*\*/\*.cc\", \"glob:\*\*/\*.h\"\]

\[fix.tools.black\] command = \[\"/usr/bin/black\", \"-\", \"\--stdin-filename=\$path\"\] patterns = \[\"glob:\*\*/\*.py\"\] \`\`\`

Now, lets see what would happen to the following history, when executing \`jj fix\`.

\`\`\`text C (mutable) \| Modifies file: foo.py \| B @ (working copy - mutable) \| Modifies file: README.md \| A (mutable) \| Modifies files: src/bar.cc and src/bar.h \| X (immutable) \`\`\`

By default, \`jj fix\` will modify revisions that matches the revset \`reachable(@, mutable())\` (see \`jj help -k revsets\`) which corresponds to the revisions \`A\`, \`B\` and \`C\` here.

The following operations will then happen:

\- For revision \`A\`, content from this revision for files \`src/bar.cc\` and \`src/bar.h\` will each be provided to \`clang-format\` and the result output will be used to recreate revision \`A\` which we will call \`A\`. All other files are untouched. - For revision \`B\`, same thing happen for files \`src/bar.cc\` and \`src/bar.h\` Their content from revision \`B\` will go through \`clang-format\`. The file \`README.md\` as any other files, are untouched as no pattern matches it. We obtain revision \`B\`. - For revision \`C\`, \`src/bar.cc\` and \`src/bar.h\` goes through \`clang-format\` and file \`foo.py\` is fixed using \`black\`. Any other file is untouched. We obtain revision \`C\`.

\`\`\`text C (mutable) /-\> C \| src/bar.cc -\> clang-format -\| \| \| src/bar.h \--\> clang-format -\| \| \| foo.py \-\-\-\--\> black \-\-\-\-\-\-\--\| \| \| \* \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--/ \| \| \| B @ (working copy - mutable) /-\> B @ \| src/bar.cc -\> clang-format -\| \| \| src/bar.h \--\> clang-format -\| \| \| \* \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--\| \| \| \| A (mutable) /-\> A \| src/bar.cc -\> clang-format -\| \| \| src/bar.h \--\> clang-format -\| \| \| \* \-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\-\--/ \| \| \| X (immutable) X \`\`\`

The revisions are now all correctly formatted according to the configuration.

# OPTIONS

**-s**, **\--source** *\<REVSETS\>*

:   Fix files in the specified revision(s) and their descendants. If no revisions are specified, this defaults to the \`revsets.fix\` setting, or \`reachable(@, mutable())\` if it is not set

**\--include-unchanged-files**

:   Fix unchanged files in addition to changed ones. If no paths are specified, all files in the repo will be fixed

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*FILESETS*\]

:   Fix only these paths

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
