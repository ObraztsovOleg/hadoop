run_hw:
	docker build -t hw2 ./hw
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:$(current_branch) hdfs dfs -mkdir -p input/h80 input/h86 input/h31 input/h55
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hw2 hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
																										-files /map_reduce/mapper,/map_reduce/reducer \
																										-mapper "./mapper" \
																										-reducer "./reducer" \
																										-input /input/h80 -output /output/h80
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hw2 hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
																										-files /map_reduce/mapper,/map_reduce/reducer \
																										-mapper "./mapper" \
																										-reducer "./reducer" \
																										-input /input/h86 -output /output/h86
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hw2 hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
																										-files /map_reduce/mapper,/map_reduce/reducer \
																										-mapper "./mapper" \
																										-reducer "./reducer" \
																										-input /input/h31 -output /output/h31
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hw2 hadoop jar /opt/hadoop-3.3.3/share/hadoop/tools/lib/hadoop-streaming-3.3.3.jar \
																										-files /map_reduce/mapper,/map_reduce/reducer \
																										-mapper "./mapper" \
																										-reducer "./reducer" \
																										-input /input/h55 -output /output/h55
.PHONY:
	run_hw
