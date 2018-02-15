#!/bin/bash

set -x

date

export HOME2=${PWD}

cd /tmp
wget https://github.com/tshr20140816/test20171031/raw/master/usr.zip

unzip usr.zip

cd ${HOME2}

wget http://ftp.jaist.ac.jp/pub/apache//httpd/httpd-2.4.29.tar.gz
tar xf httpd-2.4.29.tar.gz
rm httpd-2.4.29.tar.gz
cd httpd-2.4.29
./configure --help
./configure --prefix=/tmp/usr --with-apr=/tmp/usr --enable-ssl --enable-http2 --with-nghttp2=/tmp/usr
# make -j$(grep -c -e processor /proc/cpuinfo)
make

date
