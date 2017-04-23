FROM openjdk:8-jre-alpine
MAINTAINER Michael Dockter <michael@dockter.com>
ENV REFRESHED_AT 2017-04-15

# Install alpine packages.

RUN apk add --update \
    bash \
    curl
RUN rm -rf /var/cache/apk/*

# Download zookeeper.

RUN curl http://apache.mirrors.tds.net/zookeeper/zookeeper-3.4.10/zookeeper-3.4.10.tar.gz -o /tmp/zookeeper.tgz

# Extract zookeeper.

RUN mkdir -p /opt/zookeeper
RUN tar -xzf /tmp/zookeeper.tgz --strip-components=1 -C /opt/zookeeper

# TODO: verify download.

# Copy sample configuration file.

RUN cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

# Define external volumes.

RUN rm -rf /tmp/*
RUN mkdir -p /tmp/zookeeper
VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

# Open ports.

EXPOSE 2181 2888 3888

# Startup.

WORKDIR /opt/zookeeper
ENTRYPOINT ["/opt/zookeeper/bin/zkCli.sh"]
CMD ["help"]