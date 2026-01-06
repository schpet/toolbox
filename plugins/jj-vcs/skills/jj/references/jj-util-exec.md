# NAME

jj-util-exec - Execute an external command via jj

# SYNOPSIS

**jj util exec** \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\] \<*COMMAND*\> \[*ARGS*\]

# DESCRIPTION

Execute an external command via jj

This command will have access to the environment variable JJ_WORKSPACE_ROOT.

This is useful for arbitrary aliases.

!! WARNING !!

The following technique just provides a convenient syntax for running arbitrary code on your system. Using it irresponsibly may cause damage ranging from breaking the behavior of \`jj undo\` to wiping your file system. Exercise the same amount of caution while writing these aliases as you would when typing commands into the terminal!

This feature may be removed or replaced by an embedded scripting language in the future.

Lets assume you have a script called \"my-jj-script\" in you \$PATH and you would like to execute it as \"jj my-script\". You would add the following line to your configuration file to achieve that:

\`\`\`toml \[aliases\] my-script = \[\"util\", \"exec\", \"\--\", \"my-jj-script\"\] \# \^\^\^\^ \# This makes sure that flags are passed to your script instead of parsed by jj. \`\`\`

If you dont want to manage your script as a separate file, you can even inline it into your config file:

\`\`\`toml \[aliases\] my-inline-script = \[\"util\", \"exec\", \"\--\", \"bash\", \"-c\", \"\"\" set -euo pipefail echo \"Look Ma, everything in one file!\" echo \"args: \$@\" \"\"\", \"\"\] \# \^\^ \# This last empty string will become \"\$0\" in bash, so your actual arguments \# are all included in \"\$@\" and start at \"\$1\" as expected. \`\`\`

\> Note: Shebangs (e.g. \`#!/usr/bin/env\`) arent necessary since youre \> already explicitly passing your script into the right shell.

# OPTIONS

**-h**, **\--help**

:   Print help (see a summary with -h)

\<*COMMAND*\>

:   External command to execute

\[*ARGS*\]

:   Arguments to pass to the external command

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
