FROM openjdk:8-jre
MAINTAINER Evgeny Bataev bataev.evgeny@gmail.com

ENV PATH /opt/flume/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /opt/flume \
    && wget -qO- http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

# RUN wget -q http://search.maven.org/remotecontent?filepath=org/elasticsearch/elasticsearch/6.0.1/elasticsearch-6.0.1.jar -O /opt/flume/lib/elasticsearch-6.0.1.jar \
# 	&& wget -q http://search.maven.org/remotecontent?filepath=org/elasticsearch/client/transport/6.0.1/transport-6.0.1.jar -O /opt/flume/lib/elasticsearch-transport-6.0.1.jar

ADD assets/start-flume.sh /opt/flume/bin/start-flume
ADD assets/log4j2.properties /opt/flume/conf/log4j2.properties
COPY flume-ng-sinks/flume-ng-elasticsearch-sink/target/flume-ng-elasticsearch-sink-1.8.0.jar /opt/flume/lib/flume-ng-elasticsearch-sink-1.8.0.jar
COPY flume-ng-sinks/flume-ng-elasticsearch-sink/target/dependency/*.jar /opt/flume/lib/

ENTRYPOINT ["bash", "/opt/flume/bin/start-flume"]