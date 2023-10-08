#!/bin/bash
set -e

source "buildScript/init/env.sh"
ENV_NB4A=1
source "buildScript/lib/core/get_source_env.sh"
pushd ..

######
## From nekoray/libs/get_source.sh
######

####
if [ ! -d "sing-box-extra" ]; then
  git clone --no-checkout https://github.com/MatsuriDayo/sing-box-extra.git
fi
pushd sing-box-extra
git checkout "$COMMIT_SING_BOX_EXTRA"
#awk '{gsub("git clone --no-checkout https://github.com/MatsuriDayo/sing-box.git", "git clone -b building https://github.com/PuerNya/sing-box.git")}1' sing-box-extra/libs/get_source.sh > temp && mv -f temp sing-box-extra/libs/get_source.sh
awk '{gsub("git clone --no-checkout https://github.com/MatsuriDayo/sing-box.git", "git clone -b building https://github.com/PuerNya/sing-box.git")}1' libs/get_source.sh > temp && mv -f temp libs/get_source.sh

ENV_SING_BOX_EXTRA=1
source $SRC_ROOT/buildScript/lib/core/get_source_env.sh
NO_ENV=1 ./libs/get_source.sh

popd

popd
