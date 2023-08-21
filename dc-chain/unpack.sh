#!/bin/sh

rm -rf binutils-2.41 gcc-3.4.6 newlib-1.12.0

tar jxf binutils-2.41.tar.bz2 || exit 1
tar jxf gcc-3.4.6.tar.bz2 || exit 1
tar zxf newlib-1.12.0.tar.gz || exit 1
