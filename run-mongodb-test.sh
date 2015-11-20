#!/bin/sh
exec docker run \
	-d \
	--name=mongodb-test \
	-p 27017:27017 \
	-p 28017:28017 \
	-e AUTH=no \
	tutum/mongodb:3.0 
