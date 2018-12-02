# Dockerized Homebridge for your RaspberryPi

[![build-status](https://gitlab.com/arm-docker-images/homebridge-docker-arm32v7/badges/master/build.svg)](https://gitlab.com/arm-docker-images/homebridge-docker-arm32v7/pipelines) [![image-size](https://shields.beevelop.com/docker/image/image-size/jaedle/homebridge-arm32v7/latest.svg?style=flat)](https://hub.docker.com/r/jaedle/homebridge-arm32v7/) [![Docker Pulls](https://img.shields.io/docker/pulls/jaedle/homebridge-arm32v7.svg)](https://hub.docker.com/r/jaedle/homebridge-arm32v7/)


- Why another homebridge-docker image?
  - Should be **simple**
  - Should be **small** (< 100MB)
  - Is build on a **regular basis** to received updates (scheduled weekly)

## Run it

Precondition for this is that you already have an existing homebridge configuration in `<already-present-configuration>`.

### Copy your configuration for mounting it to the container

```sh
mkdir -p <your-path-for-homebridge>
cp <already-present-configuration> <your-path-for-homebridge>/config
```

### Start the conatiner

```sh
docker container run \
  --name homebridge \
  --restart always \
  --mount type=bind,source=$PWD/config,target=/homebridge/config \
  --net host \
  -d \
  jaedle/homebridge-arm32v7:latest
```

You should be all set! :)

## Adaption to your needs

1. Fork the repository and setup your ci/cd-pipeline
2. Adapt the plugins.txt to add new fhem plugins
3. Setup your ci-cd pipeline for that

## Acknowledgments

- Thanks to [homebridge](https://github.com/nfarina/homebridge), it's a great project!
- Thanks to [homebridge-docker](https://github.com/oznu/docker-homebridge). Was great inspiration how to dockerize homebridge!
