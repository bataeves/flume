FROM java:8-jre
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

ENV JAVA_HOME /opt/java
ENV PATH /opt/flume/bin:/opt/java/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir /opt/flume \
    && wget -qO- http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

ADD bin/start-flume.sh /opt/flume/bin/start-flume
COPY flume-ng-sinks/flume-ng-elasticsearch-sink/target/flume-ng-elasticsearch-sink-1.8.0.jar /opt/flume/lib/flume-ng-elasticsearch-sink-1.8.0.jar

ENTRYPOINT [ "start-flume" ]