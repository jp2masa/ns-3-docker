FROM ubuntu:jammy

ARG VERSION=3.36.1

RUN apt-get update \
    && apt upgrade -y \
    && apt-get install -y \
        cmake \
        g++ \
        lbzip2 \
        libboost-all-dev \
        libgsl-dev \
        libsqlite3-dev \
        libxml2-dev \
        wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://www.nsnam.org/releases/ns-allinone-${VERSION}.tar.bz2 \
    && tar -xf ns-allinone-${VERSION}.tar.bz2 \
    && cd ns-allinone-${VERSION} \
    && ./build.py --enable-examples --enable-tests

WORKDIR /ns-allinone-${VERSION}/ns-${VERSION}
