@echo "启动orderer节点"
pwdd=$PWD

for orderer in "orderer0" "orderer1" "orderer2"
do
    cd ${pwdd}/${orderer}.shie.com/
    nohup ./startOrderer.sh > ./out.log &
done

cd $PWD