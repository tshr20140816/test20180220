#!/bin/bash

set -x

date

chmod 777 start_web.sh

cd www

gzip -c test.css > test.css.gz
# chmod 666 test.css.gz
# rm test.css

date
