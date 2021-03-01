#!/usr/bin/env bash

version=1.75
build=0

# 参考：https://blog.csdn.net/this_capslock/article/details/47170313
# 如果有老版本的boost的话可以通过下面的代码删除
## remove libraries of boost
#rm -f /usr/lib/libboost*
#rm -fr 'find / -name libboost*'
## backup boost include
#mv /usr/include/boost /usr/include/boost-bak

if [ ! -d "temp"  ]; then
    mkdir temp
fi
cd temp
file=boost_${version//./_}_$build.tar.gz
if [ ! -f "$file"  ]; then
    wget https://dl.bintray.com/boostorg/release/$version.$build/source/$file
fi
tar -xzvf $file
cd boost_${version//./_}_$build/

# install essntail libs
# apt-get update
# apt-get install build-essential g++ python-dev autotools-dev libicu-dev build-essential libbz2-dev libboost-all-dev

./bootstrap.sh --with-libraries=all
./b2
./b2 install
