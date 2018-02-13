#!/bin/bash

set -x

date

# nikto
# wget https://cirt.net/nikto/nikto-2.1.5.tar.gz
# tar xvfz nikto-2.1.5.tar.gz
# pushd nikto-*
# perl ./nikto.pl -update
# popd

svn checkout http://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x httpd-2.4.x
cd ../httpd-2.4.x/
svn co http://svn.apache.org/repos/asf/apr/apr/trunk srclib/apr
./buildconf

./configure  --enable-proxy-http2 --enable-http2 --enable-proxy-http

date
