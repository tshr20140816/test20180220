#!/bin/bash

set -x

date

chmod 777 start_web.sh

pushd /tmp

wget https://osdn.jp/projects/nkf/downloads/64158/nkf-2.1.4.tar.gz
tar xf nkf-2.1.4.tar.gz
cd nkf-2.1.4
make

ls -lang

popd

mv /tmp/nkf-2.1.4/nkf ./

ls -lang

date
