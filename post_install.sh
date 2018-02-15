#!/bin/bash

set -x

date

openssl version

wget http://www.digip.org/jansson/releases/jansson-2.11.tar.bz2 &

wget https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz
tar xf c-ares-1.13.0.tar.gz
rm c-ares-1.13.0.tar.gz
cd c-ares-1.13.0
./configure --help
./configure --prefix=/tmp/usr
make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ~
rm -rf c-ares-1.13.0

wait
wget https://github.com/nghttp2/nghttp2/releases/download/v1.30.0/nghttp2-1.30.0.tar.xz &
# wget http://www.digip.org/jansson/releases/jansson-2.11.tar.bz2
tar xf jansson-2.11.tar.bz2
rm jansson-2.11.tar.bz2
cd jansson-2.11
./configure --help
./configure --prefix=/tmp/usr
make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ~
rm -rf jansson-2.11

export PATH="/tmp/usr/bin:$PATH"

wait
# wget https://github.com/nghttp2/nghttp2/releases/download/v1.30.0/nghttp2-1.30.0.tar.xz
tar xf nghttp2-1.30.0.tar.xz
rm nghttp2-1.30.0.tar.xz
cd nghttp2-1.30.0
./configure --help

LIBCARES_CFLAGS="-I/tmp/usr/include" LIBCARES_LIBS="-L/tmp/usr/lib -ljansson" \
JANSSON_CFLAGS="-I/tmp/usr/include" JANSSON_LIBS="-L/tmp/usr/lib -ljansson" \
./configure --prefix=/tmp/usr --disable-examples
make -j$(grep -c -e processor /proc/cpuinfo)
make install

ls -Rlang /tmp/usr/

cd ~
rm -rf nghttp2-1.30.0

wget http://ftp.tsukuba.wide.ad.jp/software/apache//apr/apr-1.6.3.tar.bz2
tar xf apr-1.6.3.tar.bz2
rm apr-1.6.3.tar.bz2
cd apr-1.6.3
./configure --help
./configure --prefix=/tmp/usr
make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ~
rm -rf apr-1.6.3

wget http://ftp.tsukuba.wide.ad.jp/software/apache//apr/apr-util-1.6.1.tar.bz2
tar xf apr-util-1.6.1.tar.bz2
rm apr-util-1.6.1.tar.bz2
cd apr-util-1.6.1
./configure --help
./configure --prefix=/tmp/usr --with-apr=/tmp/usr
make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ~
rm -rf apr-util-1.6.1

cd /tmp
zip -r usr.zip ./usr
cp usr.zip ~/www/usr.zip
ls -lang

cd ~

exit

wget http://ftp.jaist.ac.jp/pub/apache//httpd/httpd-2.4.29.tar.gz
tar xf httpd-2.4.29.tar.gz
rm httpd-2.4.29.tar.gz
cd httpd-2.4.29
./configure --help
./configure --prefix=/tmp/usr --with-apr=/tmp/usr --enable-ssl --enable-http2 --with-nghttp2=/tmp/usr
make -j$(grep -c -e processor /proc/cpuinfo)
# make install

date
