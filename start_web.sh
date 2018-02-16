#!/bin/bash

set -x

export TZ=JST-9

ls -lang
mkdir /tmp/usr/lib
cp libnghttp2.so.14 /tmp/usr/lib/

vendor/bin/heroku-php-apache2 -C apache.conf www
