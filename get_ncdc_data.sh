#!/bin/bash
 
CURRENT_DIR=$(cd `dirname $0`; pwd)
 
[ -e $CURRENT_DIR/ncdc ] || mkdir $CURRENT_DIR/ncdc
[ -e $CURRENT_DIR/ncdc/files ] || mkdir $CURRENT_DIR/ncdc/files
 
for i in `seq 1901 2017`
do
    cd $CURRENT_DIR/ncdc/
    wget -r -np -nH .cut-dirs=3 -R index.html ftp://ftp.ncdc.noaa.gov/pub/data/noaa/$i/
    cd pub/data/noaa/$i/
    cp *.gz $CURRENT_DIR/ncdc/files
done
