#!/bin/bash

set -x

export TZ=JST-9

httpd -V

vendor/bin/heroku-php-apache2 -C apache.conf www
