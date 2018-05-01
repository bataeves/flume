docker stop flume
docker build -t bataeves/flume .
docker run --name flume --link elasticsearch:elasticsearch --rm -d -p "34545:34545" -e FLUME_AGENT_NAME=agent -v "$PWD/assets/flume-es-conf.properties:/opt/flume/conf/flume.conf" bataeves/flume:latest
