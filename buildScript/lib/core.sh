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
go get github.com/AntiNeko/TLS-scribe@v0.3.2
go get github.com/codeclysm/extract@v2.2.0+incompatible
go get github.com/sagernet/sing-tun@v0.1.15-0.20231003035000-3ae726d9f02b
go mod tidy
#cd ../libneko
#go mod tidy
cd ../tbax
buildScript/lib/core/build.sh
