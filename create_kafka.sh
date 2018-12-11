source ./variable.sh

echo "开始部署单机kafka集群"

echo "[1/5] 判断并导入kafka镜像"
if test -z "$(docker images -q ${DOCKER_IMAGE__KAFKA})"; then
    echo "kafka镜像不存在。"
    docker load < ${SHIE-DOCKER-IMAGES}
    echo "kafka镜像导入完成。"
else
    echo "kafka镜像已存在。"
fi

echo "[2/5] 判断并导入zookeeper镜像"
if test -z "$(docker images -q ${DOCKER_IMAGE__ZOOKEEPER})"; then
    echo "kafka镜像不存在。"
    docker load < ${DOCKER_IMAGE_FILE__ZOOKEEPER}
    echo "kafka镜像导入完成。"
else
    echo "kafka镜像已存在。"
fi

echo "[3/5] 组装kafka和zookeeper的docker-compose.yaml文件"
templ=`cat ./yaml-template/kafka-docker-compose.template.yaml`
config=`cat ./envs/kafka.properties`
printf "$config\ncat << EOF\n$templ\nEOF" | bash > ./composefile/kafka-docker-compose.yaml

echo "[4/5] 启动kafka和zookeeper"
docker-compose -p shie -f ./composefile/kafka-docker-compose.yaml up -d

sleep 2
echo "[5/5] 判断kafka和zookeeper容器是否启动成功并正常服务"
echo "kafka-topics.sh --zookeeper zookeeper:2181 --list"
docker exec -it shie_kafka1_1 /opt/kafka/bin/kafka-topics.sh --zookeeper zookeeper:2181 --list

