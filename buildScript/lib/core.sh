#!/bin/bash

buildScript/lib/core/init.sh
cd ..
git clone -b dev https://github.com/SagerNet/sing-quic sing-quic
cd sing-box/test
go mod tidy
cd ..
go mod tiyd
cd ../sing-box-extra
go mod tidy
#cd ../libneko
#go mod tidy
cd ../tbax
buildScript/lib/core/build.sh
