#!/bin/sh
exec docker run \
	--rm=true \
	--name=postgresql-randomcoder-test \
	-p 5432:5432 \
	postgresql-randomcoder-test

