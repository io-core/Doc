#!/bin/bash

awk '/end-documentation-root/{p=0};p;/begin-documentation-root/{p=1}' Doc.Mod > index.rst

for i in `awk '/toctree/{f=1;}f' index.rst | tail -n +6 | awk '/^$/{exit};$1'` ; do 
	echo $i
	if [ -f "$i.Mod" ] ; then
		echo "generating $i.rst"
		awk '/end-documentation-node/{p=0};p;/begin-documentation-node/{p=1}' "$i.Mod" > "$i.rst"
	fi
done

