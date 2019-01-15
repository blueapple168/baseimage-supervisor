FROM blueapple/baseimage:base
MAINTAINER blueapple <blueapple1120@qq.com>

# Install supervisor filebeat
WORKDIR /deployments
RUN set -x && \
    apk add --no-cache --purge -uU supervisor inotify-tools && \
    rm -rf /var/cache/apk/* /tmp/* && \
    mkdir /opt && \
    curl -fsSL https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.5.4-linux-x86_64.tar.gz -o /deployments/filebeat-6.5.4-linux-x86_64.tar.gz && \
    tar -zxf /deployments/filebeat-6.5.4-linux-x86_64.tar.gz -C /opt && \
    mv /opt/filebeat-6.5.4-linux-x86_64 /opt/filebeat-6.5.4 && \
    rm -rf /deployments/filebeat-6.5.4-linux-x86_64.tar.gz

# SUPERVISOR
COPY ./supervisord.conf /etc/
COPY ./services/* /etc/supervisord.d/

ENTRYPOINT ["supervisord"]
CMD ["--nodaemon", "--configuration", "/etc/supervisord.conf"]
