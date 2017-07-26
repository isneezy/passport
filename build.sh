#!/bin/bash
clear
rm -R ./build/*
cd build/
cmake -DCMAKE_INSTALL_PREFIX=/usr ..
make

if [ "$1" == "--install" ];
then
  make install
fi

if [ "$1" == "--run" ];
then
  ./com.github.isneezy.passport
fi
