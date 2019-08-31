#!/bin/sh

mkdir tmp
mkdir tmp/XpToLevel
cp *.lua tmp/XpToLevel
cp *.toc tmp/XpToLevel

cd tmp

zip ../XPToLevel$1.zip XpToLevel XpToLevel/*.toc XpToLevel/*.lua

cd ..

rm -rf tmp
