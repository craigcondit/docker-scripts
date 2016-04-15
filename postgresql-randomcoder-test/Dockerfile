FROM insideo/postgresql:9.5.2
MAINTAINER ccondit@randomcoder.com

ENV POSTGRES_USER=randomcoder POSTGRES_DB=randomcoder POSTGRES_PASSWORD=randomcoder

COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
