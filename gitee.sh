#!/bin/sh

set -e

GITHUB_REPO=$1
GITEE_REPO=$2

GIT_SSH_COMMAND="ssh -v"

echo "GITHUB=$GITHUB_REPO"
echo "GITEE=$GITEE_REPO"

git clone --mirror "$GITHUB_REPO" && cd `basename "$GITHUB_REPO"`
git remote set-url --push origin "$GITEE_REPO"
git fetch -p origin
git for-each-ref --format 'delete %(refname)' refs/pull | git update-ref --stdin
git push --mirror
