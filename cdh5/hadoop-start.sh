#!/bin/bash

chsh -s /bin/bash hbase
chsh -s /bin/bash zookeeper
rm -f /etc/security/limits.d/{hbase,hdfs,mapred,mapreduce,yarn,90-nproc}.conf

runuser - hdfs /bin/bash -c 'hadoop namenode -format'
runuser - hdfs /bin/bash -c 'hadoop namenode >/var/log/hadoop-hdfs/namenode.log 2>&1 &'
runuser - hdfs /bin/bash -c 'hadoop secondarynamenode >/var/log/hadoop-hdfs/secondarynamenode.log 2>&1 &'
runuser - hdfs /bin/bash -c 'hadoop datanode >/var/log/hadoop-hdfs/datanode.log 2>&1 &'

# wait for HDFS to be alive
until nc -z 127.0.0.1 50070 >/dev/null 2>&1 ; do echo "Waiting for HDFS TCP Port..."; sleep 1s; done
until hdfs dfs -ls / >/dev/null 2>&1 ; do echo "Waiting for HDFS TCP Port..."; sleep 1s; done

runuser - zookeeper /bin/bash -c 'zookeeper-server-initialize --myid=1 --force'
runuser - zookeeper /bin/bash -c 'zookeeper-server start >/var/log/zookeeper/zookeeper.log 2>&1 &'

# wait for zookeeper to be alive
until (echo "ruok" | nc localhost 2181 | grep imok >/dev/null 2>&1) ; do echo "Waiting for Zookeeper..."; sleep 1s; done

# create root dir for HBase
runuser - hdfs /bin/bash -c 'hdfs dfs -mkdir -p /hbase /user/hbase && hdfs dfs -chown hbase:hbase /hbase /user/hbase'

# start HBase
runuser - hbase /bin/bash -c 'hbase master start --localRegionServers=0 >/var/log/hbase/master.log 2>&1 &'
runuser - hbase /bin/bash -c 'hbase regionserver start >/var/log/hbase/regionserver.log 2>&1 &'
runuser - hbase /bin/bash -c 'hbase thrift2 start >/var/log/hbase/thrift2.log 2>&1 &'

until nc -z 127.0.0.1 60010 >/dev/null 2>&1 ; do echo "Waiting for HBase Master UI Port..."; sleep 1s; done

echo "======================="
echo "Hadoop startup complete"
echo "======================="

while /bin/true ; do sleep 1 ; done
