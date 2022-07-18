#!/bin/bash

apt-get update &&  apt-get --force-yes --yes install wget unzip build-essential

wget -kL https://github.com/jedisct1/libsodium/releases/download/${LIBSODIUM_VERSION}/libsodium-${LIBSODIUM_VERSION}.tar.gz
tar -xvf libsodium-* && rm libsodium-1.0.14.tar.gz && mv libsodium-*/ libsodium && cd libsodium/
./configure && make && make check && make install

