#!/bin/sh

docker run \
	-d \
	-p 50070:50070 \
	-p 50010:50010 \
	-p 50030:50030 \
	-p 60010:60010 \
	-p 60020:60020 \
	-p 60030:60030 \
	-p 8020:8020 \
	-p 50090:50090 \
	-p 50075:50075 \
	--hostname hadoop \
	--name cdh5 \
	cdh5

