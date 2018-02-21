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

cd /tmp

wget https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz
tar xf cmake-3.10.2-Linux-x86_64.tar.gz
cd cmake*
ls -lang

# git clone --depth 1 https://github.com/google/brotli
# cd brotli
# ./bootstrap
# make -j2

date
