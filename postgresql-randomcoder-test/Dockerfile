FROM insideo/postgresql
MAINTAINER ccondit@randomcoder.com

ENV POSTGRES_USER=randomcoder POSTGRES_DB=randomcoder POSTGRES_PASSWORD=randomcoder

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
