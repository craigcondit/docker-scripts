#!/bin/sh
cd "$(dirname "$0")"

docker build -t kafka-test kafka-test
