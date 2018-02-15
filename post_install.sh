#!/bin/bash

set -x

date

export HOME2=${PWD}

cd /tmp
wget https://github.com/tshr20140816/test20171031/raw/master/usr.zip

unzip usr.zip

cd usr

ls -lang

date
