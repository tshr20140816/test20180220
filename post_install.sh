#!/bin/bash

set -x

date

chmod 777 start_web.sh

cd www

gzip -c test.css > test.css.gz
rm test.css

wget https://git.tt-rss.org/fox/tt-rss/raw/17.4/css/tt-rss.css
gzip -c tt-rss.css > tt-rss.css.gz
rm tt-rss.css



export PATH="/tmp/usr/bin:${PATH}"
mkdir -m 777 -p /tmp/usr

cd /tmp/usr
wget https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz
tar xf cmake-3.10.2-Linux-x86_64.tar.gz -C ./ --strip=1 
ls -lang

cd /tmp
git clone --depth 1 https://github.com/google/brotli
cd brotli
./configure-cmake --help
./configure-cmake --prefix=/tmp/usr
make -j2
make install

ls -lang /tmp/usr/bin/

brotli --help

cd /tmp

wget https://git.tt-rss.org/fox/tt-rss/raw/17.4/css/tt-rss.css
gzip -9c tt-rss.css > tt-rss.css.gz
brotli -9 -o tt-rss.css.br tt-rss.css
ls -lang

date
