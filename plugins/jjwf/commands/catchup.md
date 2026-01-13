---
description: Fetch from remote and rebase onto trunk
---

# Catchup

Fetch the latest changes from the remote and rebase the current change onto the trunk branch.

## Workflow

1. **Fetch from the remote**:
   ```bash
   jj git fetch
   ```

2. **Rebase onto trunk**:
   ```bash
   jj rebase -d trunk()
   ```

   The `trunk()` revset is a built-in jj alias that automatically resolves to the head commit of the default bookmark (typically `main` or `master`) on the default remote (`origin` or `upstream`).

3. **Show the result**:
   ```bash
   jj log -r '::@' --limit 10
   ```

## Notes

- The `trunk()` revset handles the detection of the main/master/trunk branch automatically
- If there are conflicts after rebasing, inform the user and show them with `jj status`
- If the fetch fails (e.g., no network), report the error and don't attempt the rebase
