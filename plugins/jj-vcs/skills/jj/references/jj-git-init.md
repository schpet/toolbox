# NAME

jj-git-init - Create a new Git backed repo

# SYNOPSIS

**jj git init** \[**\--colocate**\] \[**\--no-colocate**\] \[**\--git-repo**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \[*DESTINATION*\]

# DESCRIPTION

Create a new Git backed repo

# OPTIONS

**\--colocate**

:   Colocate the Jujutsu repo with the git repo

    Specifies that the \`jj\` repo should also be a valid \`git\` repo, allowing the use of both \`jj\` and \`git\` commands in the same directory.

    The repository will contain a \`.git\` dir in the top-level. Regular Git tools will be able to operate on the repo.

    \*\*This is the default\*\*, and this option has no effect, unless the \[git.colocate config\] is set to \`false\`.

    This option is mutually exclusive with \`\--git-repo\`.

    \[git.colocate config\]: https://docs.jj-vcs.dev/latest/config/#default-colocation

**\--no-colocate**

:   Disable colocation of the Jujutsu repo with the git repo

    Prevent Git tools that are unaware of \`jj\` and regular Git commands from operating on the repo. The Git repository that stores most of the repo data will be hidden inside a sub-directory of the \`.jj\` directory.

    See \[colocation docs\] for some minor advantages of non-colocated workspaces.

    \[colocation docs\]: https://docs.jj-vcs.dev/latest/git-compatibility/#colocated-jujutsugit-repos

**\--git-repo** *\<GIT_REPO\>*

:   Specifies a path to an \*\*existing\*\* git repository to be used as the backing git repo for the newly created \`jj\` repo.

    If the specified \`\--git-repo\` path happens to be the same as the \`jj\` repo path (both .jj and .git directories are in the same working directory), then both \`jj\` and \`git\` commands will work on the same repo. This is called a colocated workspace.

    This option is mutually exclusive with \`\--colocate\`.

**-h**, **\--help**

:   Print help (see a summary with -h)

\[*DESTINATION*\] \[default: .\]

:   The destination directory where the \`jj\` repo will be created. If the directory does not exist, it will be created. If no directory is given, the current directory is used.

    By default the \`git\` repo is under \`\$destination/.jj\`

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
