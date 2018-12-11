##3 - 准备Peer节点的配置和安装文件

templ=`cat ./peer-template.yaml`

for org in 'org1' 'org2'
do 
    for peer in 'peer0' 'peer1'
    do
        if [ -d ./${peer}.${org}.shie.com ]; then
            echo "${peer}.${org}.shie.com folder existed, make sure to remove it? y/N"
            read remove
            [ $remove = "y" ] && { echo "Removing..."; rm -rf ./${peer}.${org}.shie.com;  } || { echo "...skipped"; exit 1; }
        fi
        ### 1. 目录准备
        mkdir ${peer}.${org}.shie.com
        ### 2. 复制启动程序
        cp ./bin/peer ${peer}.${org}.shie.com
        ### 3. 复制peer的证书文件
        cp -rf ./certs/peerOrganizations/${org}.shie.com/peers/${peer}.${org}.shie.com/* ${peer}.${org}.shie.com/
        #端口使用变量注入
        # config=`cat ./envs/${orderer}.properties`
        # cat /dev/null > ./${orderer}.shie.com/env.properties
        #echo "ORDERER_PORT=17050" >> ./${orderer}.shie.com/env.properties

        ### 4. 新增peer节点配置
        config=`cat ./envs/${peer}.${org}.properties`
        printf "$config\ncat << EOF\n$templ\nEOF" | bash > ./${peer}.${org}.shie.com/core.yaml

        ### 5. 创建data目录
        mkdir -p ./${peer}.${org}.shie.com/data

        ### 6. 创建一个启动 peer 的批处理文件
        cp ./startPeer.sh ${peer}.${org}.shie.com
        chmod +x ${peer}.${org}.shie.com/startPeer.sh
    done
done