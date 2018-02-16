#!/bin/bash

set -x

date

export HOME2=${PWD}
export PATH="${HOME2}/usr/local/bin:${PATH}"

wget https://www.samba.org/ftp/ccache/ccache-3.3.4.tar.gz
tar xf ccache-3.3.4.tar.gz
cd ccache-3.3.4
./configure --prefix=${HOME2}/usr/local
time make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ${HOME2}/usr/local/bin
ln -s ccache gcc
ln -s ccache g++
ln -s ccache cc
ln -s ccache c++

export CCACHE_DIR=${HOME2}/ccache

cd ${HOME2}

wget https://${APP_NAME}.herokuapp.com/ccache_cache.zip
unzip ccache_cache.zip

ccache -s
ccache -z

openssl version

wget https://c-ares.haxx.se/download/c-ares-1.13.0.tar.gz
tar xf c-ares-1.13.0.tar.gz
rm c-ares-1.13.0.tar.gz
cd c-ares-1.13.0
./configure --help
./configure --prefix=/tmp/usr --config-cache
ls -lang
time make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ${HOME2}
# rm -rf c-ares-1.13.0

zip -9r ccache_cache.zip ./ccache
mv ccache_cache.zip ./www/
ccache -s

exit

wget http://www.digip.org/jansson/releases/jansson-2.11.tar.bz2
tar xf jansson-2.11.tar.bz2
rm jansson-2.11.tar.bz2
cd jansson-2.11
./configure --help
./configure --prefix=/tmp/usr
time make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ${HOME2}
rm -rf jansson-2.11

export PATH="/tmp/usr/bin:$PATH"

wget https://github.com/nghttp2/nghttp2/releases/download/v1.30.0/nghttp2-1.30.0.tar.xz
tar xf nghttp2-1.30.0.tar.xz
rm nghttp2-1.30.0.tar.xz
cd nghttp2-1.30.0
./configure --help

LIBCARES_CFLAGS="-I/tmp/usr/include" LIBCARES_LIBS="-L/tmp/usr/lib -ljansson" \
JANSSON_CFLAGS="-I/tmp/usr/include" JANSSON_LIBS="-L/tmp/usr/lib -ljansson" \
./configure --prefix=/tmp/usr --disable-examples
time make -j$(grep -c -e processor /proc/cpuinfo)
make install

ls -Rlang /tmp/usr/

cd ${HOME2}
rm -rf nghttp2-1.30.0

zip -9r ccache_cache.zip ./ccache
mv ccache_cache.zip ./www/
  
exit

wget http://ftp.tsukuba.wide.ad.jp/software/apache//apr/apr-1.6.3.tar.bz2
tar xf apr-1.6.3.tar.bz2
rm apr-1.6.3.tar.bz2
cd apr-1.6.3
./configure --help
./configure --prefix=/tmp/usr
time make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ${HOME2}
rm -rf apr-1.6.3

cd ${HOME2}

zip -9r ccache_cache.zip ./ccache
mv ccache_cache.zip ./www/
  
exit

wget http://ftp.tsukuba.wide.ad.jp/software/apache//apr/apr-util-1.6.1.tar.bz2
tar xf apr-util-1.6.1.tar.bz2
rm apr-util-1.6.1.tar.bz2
cd apr-util-1.6.1
./configure --help
./configure --prefix=/tmp/usr --with-apr=/tmp/usr
time make -j$(grep -c -e processor /proc/cpuinfo)
make install

cd ${HOME2}
rm -rf apr-util-1.6.1

# cd /tmp
# zip -r usr.zip ./usr
# cp usr.zip ${HOME2}/www/

cd ${HOME2}

zip -9r ccache_cache.zip ./ccache
mv ccache_cache.zip ./www/
  
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
