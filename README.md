# docker-timeoff-management

Docker implementation of the [timeoff-management project](https://github.com/timeoff-management/application) based on works done by [nosinovacao](https://github.com/nosinovacao/docker-timeoff-management) and [thperret](https://github.com/thperret/timeoff-management_docker).

# Using Dockerfile

By default, timeoff-management uses sqlite and no smtp server configured. 

I have tried many ways but cannot get it running using separated MySQL instance or so. But at least, I have put SQLite file `db.production.sqlite` into a separated volume (timeoff_sqlite) so data is persisted when restart.

## Building Dockerfile

```
$ docker build -t timeoff .
```

## Running Docker Image

```
$ docker run -d -p 3000:3000 --name timeoff timeoff
```

## Environment Variables

| Var Name | Possible values|
| -------- | ------ |
| **NODE_ENV** | developement(default), test, production |
| **SENDER_MAIL** | email address |
| **SMTP_HOST** | host |
| **SMTP_PORT** | port |
| **SMTP_USER** | username/address |
| **SMTP_PASSWORD** | password |
| **APP_URL** | http://app.timeoff.management (default) |
| **PROMOTION_URL** | http://timeoff.management |
| **ALLOW_ACCOUNTS_CREATION** | true , false |

# Using Docker-Compose

```
$ docker-compose up -d
```

# Docker Hub

My built image is available on Docker Hub at [pacroy/timeoff](https://hub.docker.com/r/pacroy/timeoff).