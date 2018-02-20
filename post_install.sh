#!/bin/bash

set -x

date

chmod 777 start_web.sh

cd www

gzip -c test.css > test.css.gz
rm test.css

wget https://git.tt-rss.org/fox/tt-rss/raw/17.4/css/tt-rss.css
gzip -c tt-rss.css > ttrss.css.gz
rm tt-rss.css

date
