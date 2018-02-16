#!/bin/bash

set -x

export TZ=JST-9

ls -lang

vendor/bin/heroku-php-apache2 -C apache.conf www
