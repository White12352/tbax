#!/bin/bash

buildScript/lib/core/init.sh
cd ..
rm -rf sing-box
git clone -b building https://github.com/PuerNya/sing-box.git sing-box
svn co https://github.com/MatsuriDayo/sing-box/branches/1.6.a2/nekoutils sing-box/nekoutils
cd tbax/libcore
go mod tidy
cd ..
buildScript/lib/core/build.sh
