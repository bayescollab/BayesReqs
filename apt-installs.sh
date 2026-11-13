#!/usr/bin/env bash

set -eu

apt-get update

##### C++ and wget INSTALL #####
# build-essential - libc, gcc, g++, make, dpkg-dev
# wget - Internet file retriever
DEBIAN_FRONTEND=noninteractive apt-get install -yq \
    build-essential \
    wget \
    cmake

##### PACKAGE INSTALL GUIDE #####
## DEVELOPMENT PACKAGE installs ##
    # autoconf - Produce configure scripts for building [REQUIRED FOR ADOL-C]
    # automake - Atomate parts of the compilation process
    # git - Revision control system
    # libtool - General library support script
    # swig - Generate scripting interfaces to C/C++ code

## PYTHON PACKAGE installs ##   
    # python3
    # python3-pip - Python package installer
    # python3-dev - Header files and static library for Python [REQUIRED FOR: LALSUITE]
    # python3-venv - Virtual environment manager to avoid conflicts with APT

## SCIENTIFIC AND DATA PACKAGE installs ##
    # libeigen3-dev - C++ library for linear algebra
    # libfftw3-dev - Fast Fourier Transform library
    # libgsl-dev - GNU scientific library
    # libhdf5f-dev - Heirarchical Data Format 5 (HDF5) development files
DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yq \
    autoconf \
    automake \
    git \
    libtool \
    swig \
    python3 \
    python3-dev \
    python3-pip \
    python3-venv \
    libeigen3-dev \
    libfftw3-dev \
    libgsl-dev \
    libhdf5-dev
# Clear /var/lib/apt/lists/ to reduce cache.
# Note that this will require apt-get update before running apt-get install.
rm -rf /var/lib/apt/lists/*