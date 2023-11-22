#!/bin/sh
pre="storage"
dirs="uk1 uk2 uk3 za1 za2 za3 au1 au2 au3"
for i in $dirs; do
	sudo rm -fr $pre/$i
        mkdir -p $pre/$i
done

