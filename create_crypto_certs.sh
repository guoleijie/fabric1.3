#!/bin/bash
##2 - hyperledger 证书准备

#2.1 - 通过cryptogen 来生成
if [ ! -f crypto-config.yaml ]; then
    echo "crypto-config.yaml not exist, please check"
    exit 1
fi

if [ ! -d ./certs ]; then
    ./bin/cryptogen generate --config=crypto-config.yaml --output ./certs
else
    echo "certs folder existed,...skipped"
fi
