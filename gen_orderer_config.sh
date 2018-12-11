##3 - 准备Orderer节点的配置和安装文件

templ=`cat ./orderer-template.yaml`

for orderer in 'orderer0' 'orderer1' 'orderer2'
do
    if [ -d ./${orderer}.shie.com ]; then
        echo "${orderer}.shie.com folder existed, make sure to remove it? y/N"
        read remove
        [ $remove = "y" ] && { echo "Removing..."; rm -rf ./${orderer}.shie.com;  } || { echo "...skipped"; exit 1; }
    fi
    ### 1. 目录准备
    mkdir ${orderer}.shie.com

    ### 2. 复制启动程序
    cp ./bin/orderer ${orderer}.shie.com

    ### 3. 复制orderer节点证书文件
    cp -rf ./certs/ordererOrganizations/shie.com/orderers/${orderer}.shie.com/* ./${orderer}.shie.com/
    #端口使用变量注入
    # config=`cat ./envs/${orderer}.properties`
    #cat /dev/null > ./${orderer}.shie.com/env.properties
    #echo "ORDERER_PORT=17050" >> ./${orderer}.shie.com/env.properties
    #config=`cat ./${orderer}.shie.com/env.properties`
    # printf "$config\ncat << EOF\n$templ\nEOF" | bash > ./${orderer}.shie.com/orderer.yaml

    ### 4. 新增orderer节点配置
    . ./envs/${orderer}.properties
    cp orderer-template.yaml ${orderer}.shie.com/orderer.yaml
    sed -i "s/\${ORDERER_PORT}/${ORDERER_PORT}/g" ./${orderer}.shie.com/orderer.yaml

    ### 5. 创建data目录
    mkdir -p ./${orderer}.shie.com/data

    ### 6. 创建一个启动 orderer 的批处理文件

    echo "待补充"
    cp ./startOrderer.sh ./${orderer}.shie.com/
    chmod +x ./${orderer}.shie.com/startOrderer.sh

done