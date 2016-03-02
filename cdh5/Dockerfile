FROM centos:6.7

MAINTAINER ccondit@randomcoder.com

ENV \
	CDH_VERSION=5.5.2 \
	DOWNLOAD_URL=http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.rpm \
	PKG_NAME=jdk-8u74-linux-x64.rpm

ADD RPM-GPG-KEY-cloudera /etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera
ADD cloudera-cdh5.repo /etc/yum.repos.d/cloudera-cdh5.repo

RUN \
	rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-cloudera && \
	sed -i 's/%CDH_VERSION%/'${CDH_VERSION}'/g' /etc/yum.repos.d/cloudera-cdh5.repo && \
	yum -y install wget && \
	yum -y install epel-release-6-8 && \
	rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6 && \
	yum clean metadata && \
	wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "${DOWNLOAD_URL}" && \
	rpm -Uvh "${PKG_NAME}" && \
	rm -f "${PKG_NAME}" && \
	java -version && \
	yum clean all

RUN \
	yum -y install \
		hbase hbase-master hbase-regionserver hadoop-0.20-mapreduce-tasktracker \
		hadoop-0.20-mapreduce-jobtracker hadoop-hdfs-datanode hadoop-hdfs-namenode \
		hadoop-hdfs-secondarynamenode supervisor && \
	yum clean all

ADD core-site.xml /etc/hadoop/conf/core-site.xml
ADD hbase-site.xml /etc/hbase/conf/hbase-site.xml
ADD hadoop-start.sh /hadoop-start.sh

RUN chmod 755 /hadoop-start.sh

EXPOSE 50090 50075 50070 50030 50010 60010 60020 60030 8020

ENTRYPOINT [ "/hadoop-start.sh" ]

CMD [ "/bin/bash" ]

