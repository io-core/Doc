#!/bin/bash

function brrt {

echo "grar"

}

function cronch {
local fnf="$1"
local fns="${fnf:0:-4}"
mv $fnf $fns.tmp
local i
for i in `awk '/toctree/{f=1;}f' $fns.tmp | tail -n +6 | awk '/^$/{exit};$1' | tr ' ' '&'` ; do
	local src=`echo $i | tr '&' ' ' | awk '{print $1;}'`
	local dst=`echo $i | tr '&' ' ' | awk '{print $2;}'`
	echo  "for $fnf from $src to $dst "
	if [ "${dst:0:1}" == "[" ] ; then
		if [ -f "$src.Pkg" ] ; then
			brrt "$src.Pkg" "${dst:1:-1}"
		fi
	elif [ "${dst:0:1}" == "<" ] ; then
		if [ -f "$src.Mod" ] ; then
			#echo "  in $fnf generating ${dst:1:-1}"
			awk '/end-documentation-node/{p=0};p;/begin-documentation-node/{p=1}' "$src.Mod" > "${dst:1:-1}"
			local t=`grep toctree "${dst:1:-1}" | wc | awk '{print $1;}'`
			#echo $t
			if [ $t != 0 ] ; then
				cronch "${dst:1:-1}"
			fi
		fi
	fi
done
#echo "finalizing $fns.tmp to $fnf"
cat $fns.tmp | sed -e 's/ *\(.*\)<\(.*\).rst>/   \2/g' > $fnf

}


# generate the document root
awk '/end-documentation-root/{p=0};p;/begin-documentation-root/{p=1}' Doc.Mod > index.rst

# generate document nodes referenced from document root
cronch index.rst

make clean; make html
git add gen/* gen/*/* gen/*/*/* gen/*/*/*/* gen/*/*/*/*/*
git commit -m 'regenerated odoc'
git push origin

