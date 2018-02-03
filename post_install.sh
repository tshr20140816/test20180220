#!/bin/bash

set -x

date

pushd www
gzip -c test.css > test.css.gz
# rm -f test.css

wget https://git.tt-rss.org/fox/tt-rss/raw/17.4/css/tt-rss.css
gzip -c tt-rss.css > tt-rss.css.gz
# rm tt-rss.css

popd

wget https://cirt.net/nikto/nikto-2.1.5.tar.gz
tar xvfz nikto-2.1.5.tar.gz
pushd nikto-*
perl ./nikto.pl -update
popd

date
