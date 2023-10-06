#!/bin/bash

source ../buildScript/init/env_ndk.sh

[ $rel ] || sed -i "s/buildDate .*/buildDate := `date +'%Y%m%d'`/g" date.go

BUILD=".build"

rm -rf $BUILD/android \
  $BUILD/java \
  $BUILD/javac-output \
  $BUILD/src

git clone -b dev-11 https://github.com/White12352/spa spa
ls
rm -f outbound/shadowsocksr.go
rm -f outbound/shadowsocksr_stub.go
mv -f spa/.github/outbound/* outbound/
mv -f spa/.github/test/* test/
mv -f spa/.github/transport/* transport/
sed -i '0,/berty.tech\/go-libtor v[0-999]\+\.[0-999]\+\.[0-999]\+/s//&\n\tgithub.com\/Dreamacro\/clash v1.17.0/' go.mod
awk '/github.com\/ajg\/form v[0-9]+\.[0-9]+\.[0-9]+ \/\/ indirect/ && !inserted {print "\tgithub.com/Dreamacro/protobytes v0.0.0-20230617041236-6500a9f4f158 // indirect"; inserted=1} 1' go.mod
sed -i -e '/ImageShadowTLS             = "ghcr.io\/ihciah\/shadow-tls:latest"/ { N; s/ImageShadowTLS             = "ghcr.io\/ihciah\/shadow-tls:latest"\n/ImageShadowTLS             = "ghcr.io\/ihciah\/shadow-tls:latest"\n\tImageShadowsocksR          = "teddysun\/shadowsocks-r:latest"\n/ }' test/clash_test.go
#sed -i '/ImageShadowTLS             = "ghcr.io\/ihciah\/shadow-tls:latest"/a \	\tImageShadowsocksR          = "teddysun\/shadowsocks-r:latest"' test/clash_test.go
awk '/ImageShadowTLS,/ {print; print "\tImageShadowsocksR,"; next} 1' test/clash_test.go
sed -i '/berty\.tech\/go-libtor v[0-999]\+\.[0-999]\+\.[0-999]\+ \/\//a \\tgithub.com\/Dreamacro\/clash v1.17.0 // indirect\n\tgithub.com\/Dreamacro\/protobytes v0.0.0-20230617041236-6500a9f4f158 // indirect' test/go.mod

gomobile bind -v -androidapi 21 -cache $(realpath $BUILD) -trimpath -ldflags='-s -w' -tags='with_conntrack,with_gvisor,with_quic,with_wireguard,with_utls,with_clash_api,with_ech,with_shadowsocksr' . || exit 1
rm -r libcore-sources.jar

proj=../app/libs
mkdir -p $proj
cp -f libcore.aar $proj
echo ">> install $(realpath $proj)/libcore.aar"
