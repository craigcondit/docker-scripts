#!/bin/sh
cd "$(dirname "$0")"

docker build -t postgresql-randomcoder-test postgresql-randomcoder-test
