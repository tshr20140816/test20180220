#!/bin/bash

set -x

date

pushd www
gzip -9c test.css > test.css.gz
rm -f test.css

wget https://git.tt-rss.org/fox/tt-rss/raw/17.4/css/tt-rss.css
gzip -9ac tt-rss.css > tt-rss.css.gz
rm -f tt-rss.css

popd

date
