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
go get github.com/sagernet/sing@v0.2.13-0.20231001070509-81a98bf16263
go get github.com/ulikunitz/xz@v0.5.10
go get golang.org/x/mobile@v0.0.0-20220722155234-aaac322e2105
go get github.com/sagernet/sing-quic@v0.1.2-0.20231001061659-f0ec0e24dd4d
go mod tidy
#cd ../libneko
#go mod tidy
cd ../tbax
buildScript/lib/core/build.sh
