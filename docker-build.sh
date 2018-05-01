mvn install -f flume-ng-sinks/flume-ng-elasticsearch-sink/pom.xml -DskipTests
mvn dependency:copy-dependencies -f flume-ng-sinks/flume-ng-elasticsearch-sink/pom.xml
docker build -t bataeves/flume .