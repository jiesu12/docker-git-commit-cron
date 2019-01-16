## Build
```
docker build --build-arg arch=$(dpkg --print-architecture) -t jiesu/git-commit-cron:$(dpkg --print-architecture) .
```

## Run
Create directory git_commit_key under /path/to/backup_mount_point. Put key which can commit git under there.
```
docker run -d -v ${VOLUME}:/volume -e SCHEDULE='45 4 * * *' --name ${NAME} jiesu/git-commit-cron:<arch>
```
