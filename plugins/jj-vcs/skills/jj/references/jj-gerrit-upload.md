# NAME

jj-gerrit-upload - Upload changes to Gerrit for code review, or update existing changes

# SYNOPSIS

**jj gerrit upload** \[**-r**\|**\--revisions**\] \[**-b**\|**\--remote-branch**\] \[**\--remote**\] \[**-n**\|**\--dry-run**\] \[**-R**\|**\--repository**\] \[**\--ignore-working-copy**\] \[**\--ignore-immutable**\] \[**\--at-operation**\] \[**\--debug**\] \[**\--color**\] \[**\--quiet**\] \[**\--no-pager**\] \[**\--config**\] \[**\--config-file**\] \[**-h**\|**\--help**\]

# DESCRIPTION

Upload changes to Gerrit for code review, or update existing changes.

Uploading in a set of revisions to Gerrit creates a single \"change\" for each revision included in the revset. These changes are then available for review on your Gerrit instance.

Note: The gerrit commit Id may not match that of your local commit Id, since we add a \`Change-Id\` footer to the commit message if one does not already exist. This ID is based off the jj Change-Id, but is not the same.

If a change already exists for a given revision (i.e. it contains the same \`Change-Id\`), this command will update the contents of the existing change to match.

Note: this command takes 1-or-more revsets arguments, each of which can resolve to multiple revisions; so you may post trees or ranges of commits to Gerrit for review all at once.

# OPTIONS

**-r**, **\--revisions** *\<REVISIONS\>*

:   The revset, selecting which revisions are sent in to Gerrit

    This can be any arbitrary set of commits. Note that when you push a commit at the head of a stack, all ancestors are pushed too. This means that \`jj gerrit upload -r foo\` is equivalent to \`jj gerrit upload -r mutable()::foo\`.

**-b**, **\--remote-branch** *\<REMOTE_BRANCH\>*

:   The location where your changes are intended to land

    This should be a branch on the remote. Can be configured with the \`gerrit.default-remote-branch\` repository option.

**\--remote** *\<REMOTE\>*

:   The Gerrit remote to push to

    Can be configured with the \`gerrit.default-remote\` repository option as well. This is typically a full SSH URL for your Gerrit instance.

**-n**, **\--dry-run**

:   Do not actually push the changes to Gerrit

**-h**, **\--help**

:   Print help (see a summary with -h)

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
