#!/usr/bin/env bash

set -eu

##### ADOL-C install #####
mkdir -p /opt/adolc
cd /opt/adolc
# Download old release, since we need ADOL-C to compile with OpenMP.
# New release breaks when using AutoTools, and currently the CMake installation doesn't allow for OpenMP.
# Once ADOL-C is modernized with CMake and allows this option, we should upgrade to it.
wget https://github.com/coin-or/ADOL-C/archive/refs/tags/releases/2.7.2.tar.gz
tar -zxf 2.7.2.tar.gz && rm 2.7.2.tar.gz
cd ADOL-C-releases-2.7.2
mkdir -p build
cd build

autoreconf -fi ../
../configure --prefix=/usr/local --with-openmp-flag=-fopenmp
make 
make install
# Clean up
cd /opt
rm -rf adolc