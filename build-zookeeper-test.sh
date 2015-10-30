#!/bin/sh
cd "$(dirname "$0")"

docker build -t zookeeper-test zookeeper-test
