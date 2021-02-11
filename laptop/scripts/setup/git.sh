#!/usr/bin/env bash

LATEST_TAG=$(curl https://api.github.com/repos/git/git/tags | jq -r '.[0].name')

git clone https://github.com/git/git -b "$LATEST_TAG"

cd git || exit

make configure

./configure --prefix=/usr/local --with-curl

sudo make install -j"$(nproc)"

git --version

cd - || exit

rm -rf git

source ~/scripts/setup/colors.sh

bash ~/scripts/setup/hub.sh; sleep 1
bash ~/scripts/setup/ccache.sh; sleep 1
bash ~/scripts/setup/make.sh; sleep 1
bash ~/scripts/setup/git-config.sh
