#!/bin/bash

set -x

date

openssl version

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
