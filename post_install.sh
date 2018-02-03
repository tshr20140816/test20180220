#!/bin/bash

set -x

date

pushd www
gzip -9c test.css > test.css.gz
rm -f test.css
popd

date
