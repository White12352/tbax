#!/bin/bash

buildScript/lib/core/init.sh
cd ..
rm -rf sing-box
git clone -b building https://github.com/PuerNya/sing-box.git sing-box
svn co https://github.com/MatsuriDayo/sing-box/branches/1.6.a2/nekoutils sing-box/nekoutils
cd sing-box
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
git remote add MatsuriDayo https://github.com/MatsuriDayo/sing-box
git fetch MatsuriDayo 1.6.a2
#git cherry-pick -x -n 008b4c7
#git cherry-pick -x -n 6ade9e8
git cherry-pick -x -n 22afd17
git cherry-pick -x -n fb5c7f6
#git cherry-pick -x -n 9b22789
#git cherry-pick -x -n 66bd740
#git cherry-pick -x -n 89dd568
#git cherry-pick -x -n 7af6671
#git cherry-pick -x -n 762f212
cd ../tbax/libcore
go mod tidy
cd ..
buildScript/lib/core/build.sh
