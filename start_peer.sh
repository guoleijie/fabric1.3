@echo "启动peer节点"
pwdd = $PWD

for org in "org1" "org2"
do
    for peer in "peer0" "peer1"
    do
        cd $pwdd/${peer}.${org}.shie.com/
        nohup ./startPeer.sh > ./out.log &
    done
done

cd $PWD