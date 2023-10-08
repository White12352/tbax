#!/bin/bash

buildScript/lib/core/init.sh
cd sing-box
go mod tidy
buildScript/lib/core/build.sh
