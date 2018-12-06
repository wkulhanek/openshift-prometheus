FROM docker.io/centos:7
LABEL maintainer="Wolfgang Kulhanek <WolfgangKulhanek@gmail.com>"

ENV NODE_EXPORTER_VERSION=0.17.0

RUN yum -y update && yum -y upgrade && yum clean all && \
    curl -L -o /tmp/node_exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v$NODE_EXPORTER_VERSION/node_exporter-$NODE_EXPORTER_VERSION.linux-amd64.tar.gz && \
    tar -xzf /tmp/node_exporter.tar.gz && \
    mv ./node_exporter-$NODE_EXPORTER_VERSION.linux-amd64/node_exporter /bin && \
    rm -rf ./node_exporter-$NODE_EXPORTER_VERSION.linux-amd64 && \
    rm /tmp/node_exporter.tar.gz && \
    mkdir /textfile_collector

EXPOSE      9100
USER        nobody
ENTRYPOINT [ "/bin/node_exporter" ]
