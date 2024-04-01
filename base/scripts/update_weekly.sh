#!/usr/bin/env bash
set -euo pipefail

# delete update-deps branch if it exists and create new one and checkout to it
git branch -D update-deps
git checkout -b update-deps

# TODO: test only
# generate current datetime for Cargo.lock.tmp
date > Cargo.lock.tmp

# add Cargo.lock.tmp to git
git add Cargo.lock.tmp

# return if Cargo.lock.tmp is not changed with git diff
#if [ -z "$(git diff -- Cargo.lock.tmp)" ]; then
#    echo "Cargo.lock is not changed"
#    exit 0
#fi

# commit with message "Update dependencies"
git commit -am "Update dependencies"

# force push to update-deps branch
git push origin update-deps -f

# create pull request
log=$(cat cargo_update.log)
body='
Automation to keep dependencies in \`Cargo.lock\` current.
<details open>
<summary>cargo update log</summary>

```log
'$log'
```
'

gh pr create --title="chore(update-deps): weekly cargo update" --body "${body}" --base main --repo 0xqd/tmp
