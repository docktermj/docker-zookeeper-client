# docker-zookeeper-client

## Build

```console
sudo docker build \
    --tag dockter/zookeeper-client:0.1 \
    .
```

References:

- [docker build](https://docs.docker.com/edge/engine/reference/commandline/build/)

## Run

```console
sudo docker-compose up
```

Find

```console
sudo docker-compose ps
```

```console
sudo docker attach XXXXX
```



## Run

Find the IP address of host running ZooKeeper.  Example:

```console
ZOOKEEPER_HOST=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
```

Connect to zookeeper service over `eth0` network interface.

```console
sudo docker run \
    --interactive \
    --tty \
    --name zookeeper-client \
    dockter/zookeeper-client:0.1 \
        -server ${ZOOKEEPER_HOST}:2181
```

References:

- [docker run](https://docs.docker.com/edge/engine/reference/commandline/run/)

## Remove

```console
sudo docker rm zookeeper-client
```

## Push to DockerHub

[dockter/zookeeper-client](https://hub.docker.com/r/dockter/zookeeper-client/)

```console
sudo docker login
sudo docker push dockter/zookeeper-client:0.1
```

References:

- [docker login](https://docs.docker.com/edge/engine/reference/commandline/login/)
- [docker push](https://docs.docker.com/edge/engine/reference/commandline/push/)


## Technical details

FROM [openjdk:8-jre-alpine](https://github.com/docker-library/openjdk/blob/master/8-jre/Dockerfile)


## References

1. [github go-zkcli](https://github.com/go-zkcli/zkcli)