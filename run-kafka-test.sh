#!/bin/sh
docker run \
	-d \
	--name=kafka-test \
	-p 9092:9092 \
	--link zookeeper-test:zookeeper \
	-e KAFKA_ZK_CHROOT=/kafka \
	-e KAFKA_ADVERTISED_HOST=127.0.0.1 \
	insideo/kafka

sleep 5
docker logs kafka-test

docker exec -it kafka-test /bin/sh -c '/usr/share/kafka/bin/kafka-topics.sh \
	--zookeeper ${ZOOKEEPER_PORT_2181_TCP_ADDR}:${ZOOKEEPER_PORT_2181_TCP_PORT}${KAFKA_ZK_CHROOT} \
	--create --topic test --partitions 10 --replication-factor 1'

docker exec -it kafka-test /bin/sh -c '/usr/share/kafka/bin/kafka-topics.sh \
	--zookeeper ${ZOOKEEPER_PORT_2181_TCP_ADDR}:${ZOOKEEPER_PORT_2181_TCP_PORT}${KAFKA_ZK_CHROOT} \
	--describe'
