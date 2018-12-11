# 安装fabric 1.3.1

if [ ! -f ./hyperledger-fabric-1.3.1-stable-linux-amd64.1.3.1-stable-ce1bd72.tar.gz ]; then
    wget https://nexus.hyperledger.org/service/local/repositories/releases/content/org/hyperledger/fabric/hyperledger-fabric-1.3.1-stable/linux-amd64.1.3.1-stable-ce1bd72/hyperledger-fabric-1.3.1-stable-linux-amd64.1.3.1-stable-ce1bd72.tar.gz
fi 
tar -xvf hyperledger-fabric-1.3.1-stable-linux-amd64.1.3.1-stable-ce1bd72.tar.gz