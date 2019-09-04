#!/bin/sh

mkdir tmp
mkdir tmp/XPToLevel
cp *.lua tmp/XPToLevel
cp *.toc tmp/XPToLevel

cd tmp

zip ../XPToLevel$1.zip XPToLevel XPToLevel/*.toc XPToLevel/*.lua

cd ..

rm -rf tmp
