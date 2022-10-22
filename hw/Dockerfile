FROM bde2020/hadoop-base:2.0.0-hadoop3.3.3-java8

WORKDIR /

RUN mkdir -p map_reduce/input

COPY ./hw/bin/* /map_reduce/
COPY ./hw/h_info/* /map_reduce/input/

RUN \
    hadoop fs -mkdir -p input && \
    hdfs dfs -put ./map_reduce/input/* input && \
    rm -rf /map_reduce/input/* && \
    hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
    -files /map_reduce/mapper,/map_reduce/reducer \
    -mapper "./mapper" \
    -reducer "./reducer" \
    -input /input -output /output
    
