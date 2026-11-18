FROM ubuntu:26.04

# Path to Python environment to be created
ARG PYENV=/usr/gwatpyenv

WORKDIR /usr/local

# Install requirements
COPY apt-installs.sh ./
RUN bash apt-installs.sh

# Install ADOL-C
COPY adolc-install.sh ./
RUN bash adolc-install.sh
