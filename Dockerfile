FROM blueapple/baseimage:base

#Install supervisor
RUN set -xe && \
    apk add --no-cache --purge -uU supervisor inotify-tools && \
	rm -rf /var/cache/apk/* /tmp/*
  
ENTRYPOINT ["supervisord"]
CMD ["--nodaemon", "--configuration", "/etc/supervisord.conf"]
