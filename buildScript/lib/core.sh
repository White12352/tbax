#!/bin/bash

buildScript/lib/core/init.sh
cd ..
git clone -b dev https://github.com/SagerNet/sing-quic sing-quic
git clone -b main https://github.com/MatsuriDayo/libneko libneko
cd sing-box/test
go mod tidy
cd ..
go mod tidy
cd ../sing-box-extra
go mod tidy
#cd ../libneko
#go mod tidy
cd ../tbax
buildScript/lib/core/build.sh
