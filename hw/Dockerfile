FROM bde2020/hadoop-base:2.0.0-hadoop3.3.3-java8

WORKDIR /

RUN mkdir -p map_reduce/input/h31 map_reduce/input/h55 map_reduce/input/h80 map_reduce/input/h86

COPY ./bin/* /map_reduce/
COPY ./data/h80/* /map_reduce/input/h80/
COPY ./data/h86/* /map_reduce/input/h86/

RUN \
    hadoop fs -mkdir -p input/h80 input/h86 && \
    hdfs dfs -put ./map_reduce/input/h80/* input/h80 && \
    hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
    -files /map_reduce/mapper,/map_reduce/reducer \
    -mapper "./mapper" \
    -reducer "./reducer" \
    -input /input/h80 -output /output/h80
RUN \
    hdfs dfs -put ./map_reduce/input/h86/* input/h86 && \
    hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
    -files /map_reduce/mapper,/map_reduce/reducer \
    -mapper "./mapper" \
    -reducer "./reducer" \
    -input /input/h86 -output /output/h86

