nikashitsa/file-backup
======================
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg) [![](https://img.shields.io/docker/stars/nikashitsa/file-backup.svg)](https://hub.docker.com/r/nikashitsa/file-backup 'DockerHub') [![](https://img.shields.io/docker/pulls/nikashitsa/file-backup.svg)](https://hub.docker.com/r/nikashitsa/file-backup 'DockerHub')

Provides [duplicity](http://duplicity.nongnu.org/) incremental backup to [S3](https://aws.amazon.com/s3/) under cron (based on Alpine Linux).

### Install

Please have a look at docker-compose.example.yml

```
...
    volumes:
      - /path/to/your/files:/data
      - /file-backup/cache:/root/.cache/duplicity
    environment:
      REMOTE_URL: 's3://s3.eu-central-1.amazonaws.com/bucket-name/my-files'
      AWS_ACCESS_KEY_ID: 'PUT YOUR VALUE HERE'
      AWS_SECRET_ACCESS_KEY: 'PUT YOUR VALUE HERE'
...
```

1. You need to change `/path/to/your/files` and `/file-backup/cache`
2. Change `REMOTE_URL` with your value
3. Set your `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` values

### Start
```
docker-compose up -d
```

### Manual Exec

Additional scripts are provided to make it easier to manually invoke backups.
```
docker exec -it myfilebackup backup [full|incremental]
docker exec -it myfilebackup status
docker exec -it myfilebackup restore
```

You can restore backup to specified time. More info [here](http://duplicity.nongnu.org/duplicity.1.html#sect8).
```
docker exec -it myfilebackup restore -t 1D
```
