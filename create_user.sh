##7 - 创建user
echo "开始创建cli"

templ=`cat ./peeruser-template.sh`
userpeer="peer1"

for org in "org1" "org2"
do
    ### 1. 准备目录
    mkdir -p ./users/User1@${org}.shie.com/
    ### 2. 复制用户证书
    cp -rf ./certs/peerOrganizations/${org}.shie.com/users/Admin@${org}.shie.com/* ./users/User1@${org}.shie.com
    ### 3. 复制peer节点的配置文件
    cp ./peer1.${org}.shie.com/core.yaml  ./users/User1@${org}.shie.com/
    ### 4. 创建测试脚本
    config=`cat ./envs/${userpeer}.${org}.properties`
    printf "$config\ncat << EOF\n$templ\nEOF" | bash > ./users/User1@${org}.shie.com/peer.sh
    chmod +x ./users/User1@${org}.shie.com/peer.sh
done