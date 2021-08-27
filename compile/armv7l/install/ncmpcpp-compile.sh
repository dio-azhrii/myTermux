#!/usr/bin/env bash

DEPENDENCY_PACKAGES=(
  git clang autoconf automake libtool pkg-config boost
)

for DEPENDENCY_PACKAGE in ${DEPENDENCY_PACKAGES[@]}; do
  pkg i -y $DEPENDENCY_PACKAGE
done

git clone https://github.com/ncmpcpp/ncmpcpp
cd ncmpcpp
./autogen.sh
sed -i '36i\#include <linux/in.h>' src/screen/visualizer.cpp 
./configure --enable-outputs --enable-visualizer --enable-clock --enable-static-boost
make
strip src/ncmpcpp