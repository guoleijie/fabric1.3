#fabric 1.3单机部署脚本

all:
	make pre_install;
	make start_kafka;
	make start_couchdb;
	make setup_hosts;
	make create_cryptocerts;
	make gen_orderer_config;
	make gen_peer_config;
	make gen_genesis_block;
	make start_orderer;
	make start_peer;
	make create_cli;
	make gen_channel;
clean:
	@echo "开始清理垃圾程序"
pre_install:
	@echo "pre_install"
	tar xvf hyperledger-fabric-1.3.1-stable-linux-amd64.1.3.1-stable-ce1bd72.tar.gz
start_kafka:
	@echo "安装启动kafka&zookeeper"
	sh ./create_kafka.sh
start_couchdb:
	@echo "安装启动couchdb"
	docker-compose -p shie -f ./couchdb/docker-compose.yaml up -d
setup_hosts:
	@echo "设置本地域名"
	sudo echo `cat ./yaml-template/hosts.text` >> /etc/hosts
create_cryptocerts:
	@echo "生成整套证书文件"
	sh ./create_crypto_certs.sh
gen_orderer_config:
	@echo "生成orderer节点配置"
	sh ./gen_orderer_config.sh
gen_peer_config:
	@echo "生成peer节点配置"
	sh ./gen_peer_config.sh
gen_genesis_block:
	@echo "生成创世块"
	sh ./create_crypto_certs.sh
start_orderer:
	sh start_orderer.sh
start_peer:
	sh start_peer.sh
create_cli:
	# @echo "创建cli节点"
	sh ./create_admin.sh
	sh ./create_user.sh
gen_channel:
	@echo "开始创建channel"
	sh ./gen_channel.sh
