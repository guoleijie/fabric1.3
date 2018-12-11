#2.1 - 通过cryptogen 来生成
if [ ! -f ./crypto-config.yaml]
    echo "crypto-config.yaml not exist, please check"
    exit 1
fi
if [ ! -d ./certs]
./bin/cryptogen generate --config=crypto-config.yaml --output ./certs
else
echo "certs folder existed,...skipped"