#!/bin/sh
wget -c https://ftp.gnu.org/gnu/binutils/binutils-2.41.tar.bz2 || exit 1
wget -c https://ftp.gnu.org/gnu/gcc/gcc-3.4.6/gcc-3.4.6.tar.bz2 || exit 1
wget -c ftp://sourceware.org/pub/newlib/newlib-1.12.0.tar.gz || exit 1

