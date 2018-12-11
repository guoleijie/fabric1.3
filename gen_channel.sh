##8 - channel的准备和创建

### 1. 准备channel文件，使用configtxgen生成channel文件

./bin/configtxgen -profile TwoOrgsChannel -outputCreateChannelTx shiechannel.tx -channelID shiechannel

### 2. 创建channel
. ./gen_channel_block.sh

### 复制到外面
cp ./users/Admin@org1.shie.com/shiechannel.block .


### 3. 将生成的channel创世块复制到其他user和admin目录
for org in "org1" "org2"
do
    for user in "Admin" "User1"
    do
        cp -f ./shiechannel.block  ./users/${user}@${org}.shie.com/
    done
done