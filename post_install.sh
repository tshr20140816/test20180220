#!/bin/bash

set -x

date

export HOME2=${PWD}

cd /tmp
wget https://${APP_NAME}.herokuapp.com/usr.zip

unzip usr.zip

cd usr

ls -lang

date
