#!/bin/sh

set -e

VOLUME='/volume'

cd $VOLUME

echo "$(date) Start git commit job"

for d in $(ls -d */)
do
  if [ -d "${d}/.git" ]
  then
    echo "checking ${d}"
    cd ${VOLUME}/${d}
    if [ "$(git status --porcelain)" ]; then
      echo " - Found new changes, will commit"
      git add --all
      git commit -m autoupdate
      GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git pull --rebase
      GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git push
    else
      echo "No change, will not commit"
      GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git pull --rebase
    fi
  fi
  cd ${VOLUME}
done

echo "done"

