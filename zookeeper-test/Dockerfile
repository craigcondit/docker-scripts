FROM insideo/zookeeper
MAINTAINER ccondit@randomcoder.com

COPY docker-entrypoint-init.d /docker-entrypoint-init.d

RUN \
	opkg update && \
	opkg install bash ncurses-base && \
	opkg clean
