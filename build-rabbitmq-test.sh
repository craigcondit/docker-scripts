#!/bin/sh
cd "$(dirname "$0")"

docker build -t rabbitmq-test rabbitmq-test
