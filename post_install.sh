#!/bin/bash

set -x

date

# nikto
# wget https://cirt.net/nikto/nikto-2.1.5.tar.gz
# tar xvfz nikto-2.1.5.tar.gz
# pushd nikto-*
# perl ./nikto.pl -update
# popd

wget https://github.com/nghttp2/nghttp2/releases/download/v1.30.0/nghttp2-1.30.0.tar.xz
tar xf nghttp2-1.30.0.tar.xz
ls -lang nghttp2*

exit

wget http://ftp.jaist.ac.jp/pub/GNU/libtool/libtool-2.4.6.tar.xz
tar xf libtool-2.4.6.tar.xz

cd libtool-2.4.6
ls -lang

./configure --prefix=/tmp/libtool/
make -j4
make install

ls -lang /tmp/libtool/bin

cd ~

git clone --depth 1 -b 2.4.x https://github.com/apache/httpd.git

cd httpd/srclib
ls -lang

git clone --depth 1 https://github.com/apache/apr.git

cd ..
pwd

# printenv

export PATH="/tmp/libtool/bin:$PATH"

./buildconf --help
./buildconf

ls -lang

./configure  --help
./configure  --enable-proxy-http2 --enable-http2 --enable-proxy-http

date
