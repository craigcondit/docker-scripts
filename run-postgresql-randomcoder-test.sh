#!/bin/sh
exec docker run \
	-d \
	--name=postgresql-randomcoder-test \
	-p 5432:5432 \
	postgresql-randomcoder-test

