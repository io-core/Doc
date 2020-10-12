#!/bin/bash

rm -f core/core.md
rm -f core/*/*.md
rm -f stdlibs/stdlibs.md
rm -f stdlibs/*/*.md
rm -f extlibs/extlibs.md
rm -f extlibs/*/*.md
for i in `ls -d ../src/github.com/io-core/*`; do 
	for j in `ls $i/*.Pkg 2>/dev/null`; do 
		k=`grep '^doc' $j | awk -F',' '{print $2}'`
		ref=`echo $j | sed -e 's/...src.github.com.io-core.\(.*\).Pkg/\1.md/g'` 
		echo $ref >> $k/$k.md
		for l in `grep '^p,' $j | awk -F',' '{print $2}'`; do
			echo "$l" >> $k/$ref 
		done
	done
done
