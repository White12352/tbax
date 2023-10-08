#!/bin/bash

buildScript/lib/core/init.sh
cd ../sing-box
go mod tidy
cd ../tbax
buildScript/lib/core/build.sh
