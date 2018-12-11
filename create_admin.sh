##6 - 创建cli
echo "开始创建cli"

templ=`cat ./peeruser-template.sh`
adminpeer="peer0"
for org in "org1" "org2"
do
    ### 1. 目录准备
    mkdir -p ./users/Admin@${org}.shie.com
    ### 2. 复制admin证书文件
    cp -rf ./certs/peerOrganizations/${org}.shie.com/users/Admin@${org}.shie.com/* ./users/Admin@${org}.shie.com
    ### 3. 复制节点配置文件到用户路径
    cp ./peer0.${org}.shie.com/core.yaml ./users/Admin@${org}.shie.com/
    ### 4. 创建测试脚本
    config=`cat ./envs/${adminpeer}.${org}.properties`
    printf "$config\ncat << EOF\n$templ\nEOF" | bash > ./users/Admin@${org}.shie.com/peer.sh
    chmod +x ./users/Admin@${org}.shie.com/peer.sh
done