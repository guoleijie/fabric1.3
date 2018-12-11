##4 - 准备创世区块genesisblock(kafka模式)
### 1. 准备创世块配置文件configtx.yaml
echo ['start to create genesisblock']
echo ['[1/2] create genesisblock']
### 2. 生成创世区块
./bin/configtxgen -profile TwoOrgsOrdererGenesis -outputBlock ./genesisblock -channelID genesisblock
### 3. 把创世区块genesisblock复制到order节点
echo ['[2/2] copy genesisblock to orderers']
for orderer in "orderer0" "orderer1" "orderer2"
do
    cp ./genesisblock ${orderer}.shie.com
    cp ./genesisblock ${orderer}.shie.com
    cp ./genesisblock ${orderer}.shie.com
done

echo ['finished']