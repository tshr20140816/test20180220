#!/bin/bash

set -x

date

openssl version

wget https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz
tar xf c-ares-1.13.0.tar.gz
cd c-ares-1.13.0
./configure --help
./configure --prefix=/tmp/usr/
make -j
make install

cd ~

export PATH="/tmp/usr/bin:$PATH"

wget https://github.com/nghttp2/nghttp2/releases/download/v1.30.0/nghttp2-1.30.0.tar.xz
tar xf nghttp2-1.30.0.tar.xz
cd nghttp2-1.30.0
./configure --help
./configure --prefix=/tmp/usr/
make -j
make install

ls -Rlang /tmp/usr/

cd ~

date
