cd ./users/Admin@org1.shie.com/

./peer.sh channel create -o orderer0.shie.com:17050 -c shiechannel -f ../../shiechannel.tx  -t 60s --tls true --cafile  ../../certs/ordererOrganizations/shie.com/tlsca/tlsca.shie.com-cert.pem