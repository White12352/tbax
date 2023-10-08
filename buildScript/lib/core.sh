#!/bin/bash

buildScript/lib/core/init.sh
cd ..
rm -rf sing-box
git clone -b building https://github.com/PuerNya/sing-box.git sing-box
cd tbax
buildScript/lib/core/build.sh
