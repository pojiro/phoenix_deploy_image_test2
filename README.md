# About this repo

This repo is for testing docker image of phoenix deployment.

The Dockerfile includes build instructions, so the generated image is not small.

# How to run docker container

```
$ docker-compose build
$ docker-compose run phoenix mix ecto.migrate
$ docker-compose up -d
```

