#!/bin/sh
exec docker run \
	-d \
	--name=zookeeper-test \
	-p 2181:2181 \
	zookeeper-test
