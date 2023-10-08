#!/bin/bash

buildScript/lib/core/init.sh
cd ../sing-box
go mod tidy
cd ../sing-box-extra
go mod tidy
cd ../libneko
go mod tidy
cd ../tbax
buildScript/lib/core/build.sh
