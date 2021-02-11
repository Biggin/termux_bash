#!/usr/bin/env bash

cd /tmp || exit 1
git clone git://github.com/ccache/ccache.git
cd ccache || exit 1
./autogen.sh
./configure --with-libzstd-from-internet --with-libb2-from-internet
make -j"$(nproc --all)"
sudo make install
rm -rf "${PWD}"
cd - || exit 1
