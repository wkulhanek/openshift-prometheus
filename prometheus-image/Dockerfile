FROM docker.io/centos:7
LABEL maintainer="Wolfgang Kulhanek <WolfgangKulhanek@gmail.com>"

ENV PROMETHEUS_VERSION=2.8.0

RUN yum -y update && yum -y upgrade  && \
    yum -y clean all && \
    rm -rf /var/cache/yum && \
    curl -L -o /tmp/prometheus.tar.gz https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz && \
    tar -xmzf /tmp/prometheus.tar.gz && \
    mv ./prometheus-$PROMETHEUS_VERSION.linux-amd64 /usr/share/prometheus && \
    ln -s /usr/share/prometheus/prometheus /bin/prometheus && \
    ln -s /usr/share/prometheus/promtool /bin/promtool && \
    mkdir -p /etc/prometheus && \
    mkdir -p /prometheus && \
    chmod 777 /prometheus && \
    rm /tmp/prometheus.tar.gz

COPY config.yml /etc/prometheus/prometheus.yml

EXPOSE      9090
USER        nobody
VOLUME     [ "/prometheus" ]
WORKDIR    /prometheus
ENTRYPOINT [ "/bin/prometheus" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--web.listen-address=:9090", \
             "--web.console.templates=/usr/share/prometheus/consoles", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention=24h", \
             "--storage.tsdb.min-block-duration=15m", \
             "--storage.tsdb.max-block-duration=60m" \
            ]
