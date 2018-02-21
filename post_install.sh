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

git clone --depth 1 https://github.com/google/brotli
cd brotli
./bootstrap
# make -j2

date
