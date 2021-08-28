#!/bin/bash

function zap {
local j="$1"
local k="$2"
local pkgn="$3"
local prnt="$4"
local pprnt="$5"
local prntsub="${prnt:0:-4}Modules.rst"
local pkgnmd="$3Modules"

echo "prntsub = $prntsub pkgnmd = $pkgnmd"

	echo ".. toctree::" >> $prnt
	echo "   :maxdepth: 3" >> $prnt
	echo "   :caption: $pkgn:" >> $prnt
	echo "   :hidden:" >> $prnt
	echo "" >> $prnt
	echo "   Modules <$pkgnmd>" >> $prnt
	echo "" >> $prnt

	rm $prntsub
	echo "" >> $prntsub
	echo "##########################" >> $prntsub
	echo "  $pkgn Modules  " >> $prntsub
	echo "##########################" >> $prntsub
	echo " " >> $prntsub
	echo ".. toctree::" >> $prntsub
	echo "   :titlesonly:" >> $prntsub
	#echo "   :caption: $pkgn:" >> $prntsub
	echo "   :glob:" >> $prntsub
	echo "" >> $prntsub
	echo "   $pkgn/*" >> $prntsub
	echo "" >> $prntsub
	echo "   * - $pkgn " >> $pprnt
	echo "     - $pdsc " >> $pprnt
	echo "" >> $k/$pprnt

	for module in `grep '^p,' $j | awk -F',' '{print $2}'`; do
			snam=`echo $module | sed -e 's/\(.*\).Mod/\1/g'`
			muse=`awk '/end-module-use-description/{p=0};p;/begin-module-use-description/{p=1}' "../$pkgn/$snam.Mod"`
			mdev=`awk '/end-module-develop-description/{p=0};p;/begin-module-develop-description/{p=1}' "../$pkgn/$snam.Mod"`
			mimp=`awk '/^ *IMPORT/{print}' "../$pkgn/$snam.Mod" | sed -e 's/IMPORT//g' | tr -d ',' | tr -d ';' `
			mcst=`awk '/^ *CONST/{f=1;count=1} f{ if(/^ *TYPE/){count--; if(count==0) exit}; print}' "../$pkgn/$snam.Mod" | sed -e 's/^ *CONST//g'`
			mtyp=`awk '/^ *TYPE/{f=1;count=1} f{if(/^ *VAR/){count--; if(count==0) exit}; print}' "../$pkgn/$snam.Mod" | sed -e 's/^ *TYPE//g' `
			mvar=`awk '/^ *VAR/{f=1;count=1} f{ print; if(/^$/){count--; if(count==0) exit}}' "../$pkgn/$snam.Mod" | sed -e 's/^ *VAR//g'`
			#mprc=`awk '/end-procedure-description/{p=0};p;/begin-procedure-description/{p=1};/end-section-description/{q=0};q;/begin-section-description/{q=1};/^ *PROCEDURE/{print "::";print ""$0"";print ""}' "../$pkgn/$snam.Mod" | sed -e "s/~~~pkgn~~~/$pkgn/g" | sed -e "s/~~~snam~~~/$snam/g" `
			mprc=`awk '/end-procedure-description/{p=0};p;/begin-procedure-description/{p=1};/^ *PROCEDURE/{print "::";print ""$0"";print ""}' "../$pkgn/$snam.Mod" | sed -e "s/~~~pkgn~~~/$pkgn/g" | sed -e "s/~~~snam~~~/$snam/g" `
			#mprc=`cat x.tmp`
			#rm x.tmp
#			echo "   $snam <$pkgn/$snam>" >> $prntsub
			
			
		        mkdir -p "$k/$pkgn"	
			echo "####################################" > "$k/$pkgn/$snam.rst"
			echo "  $snam Module " >> "$k/$pkgn/$snam.rst" 
			echo "####################################" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  About  " >> "$k/$pkgn/$snam.rst"
			echo "++++++++" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Command Guide  " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$muse" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  API Guide  " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Dependencies  " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo ".. code-block:: none" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$mimp" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Constants  " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo ".. code-block:: none" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$mcst" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Types  " >> "$k/$pkgn/$snam.rst"
			echo "+++++++++" >> "$k/$pkgn/$snam.rst"
			echo ".. code-block:: none" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$mtyp" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Variables  " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo ".. code-block:: none" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$mvar" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Functions and Procedures  " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo ".. code-block:: none" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$mprc" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo "  Development Guide " >> "$k/$pkgn/$snam.rst"
			echo "++++++++++++++++++++" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			echo "$mdev" >> "$k/$pkgn/$snam.rst"
			echo " " >> "$k/$pkgn/$snam.rst"
			
			echo "https://github.com/io-core/$pkgn/blob/main/$snam.Mod" >> "$k/$pkgn/$snam.rst"
			echo >> "$k/$pkgn/$snam.rst"

	
	done
	echo " " >> $prntsub
	#echo "------------------------------- " >> $prntsub
	#echo "  These are the $pkgn modules" >> $prntsub
	#echo "------------------------------- " >> $prntsub
	#echo " " >> $prntsub
	#echo "--------------" >> $2
	#echo "  Modules  " >> $2
	#echo "--------------" >> $2
	#echo " " >> $2
	echo ".. list-table::  " >> $prntsub
	echo "   :widths: 20 80 " >> $prntsub
	echo "   :header-rows: 1 " >> $prntsub
	echo >> $prntsub
	echo "   * - Module " >> $prntsub
	echo "     - Description " >> $prntsub
	echo >> $prntsub

	for module in `grep '^p,' $j | awk -F',' '{print $2}'`; do
			snam=`echo $module | sed -e 's/\(.*\).Mod/\1/g'`
			short=`awk '/end-module-short-description/{p=0};p;/begin-module-short-description/{p=1}' "../$pkgn/$snam.Mod"`
			# echo "* **$snam** : (something)" >> $prntsub
			echo "   * - $snam " >> $prntsub
			echo "     - $short " >> $prntsub
		        #echo >> $prntsub

#			echo "   :ref:`$snam <$pkgn/$snam.rst>` " >> $prntsub
#			echo >> $prntsub
	done
	echo >> $prntsub
	


}

function brrt {
local pkgf="$1"
local rstf="$2"
local prnt="$3"
local pkgp="${rstf:0:-4}"
local pkgn=`echo $pkgp | awk -F'/' '{print $2}'`
local phead="N"

	mkdir -p $k/$pkgn

	j=$pkgf

	k=`grep '^doc' $j | awk -F',' '{print $2}'`
	pver=`grep '^package' $j | awk -F',' '{print $3}'`
	pdsc=`grep '^doc' $j | awk -F',' '{print $3}'`
	frst=`awk -F',' '/^p,/{print $2;exit;}' $j`
	pabt=`awk '/end-package-description/{p=0};p;/begin-package-description/{p=1}' ../$pkgn/$frst`
	pdep=`grep '^r' $j | awk -F',' '{print $2"/"$3}'|awk -F'/' '{print "* "$2" "$3}'`
	pdev=`awk '/end-package-development/{p=0};p;/begin-package-development/{p=1}' ../$pkgn/$frst`
	#pdev="Development Guide for this package..."

	echo "########################" > $2
	echo "  $pkgn Package " >> $2
	echo "########################" >> $2
	echo "" >> $2
	echo "Version $pver" >> $2
	echo "" >> $2
	echo "$pkgn $pdsc " >>  $2
	echo "" >> $2

	#echo "------------------------" >> $2
	#echo "  Package Modules  " >> $2
	#echo "------------------------" >> $2
	#echo " " >> $2
	zap "$j" "$k" "$pkgn" "$2" "$prnt"
	echo " " >> $2

#	echo "--------------" >> $2
#	echo "  Modules  " >> $2
#	echo "--------------" >> $2
#	echo " " >> $2
#	echo ".. list-table::  " >> $2
#	echo "   :widths: 20 80 " >> $2
#	echo "   :header-rows: 1 " >> $2
#	echo >> $2
#	echo "   * - Module " >> $2
#	echo "     - Description " >> $2
#	echo >> $2
#
#	for module in `grep '^p,' $j | awk -F',' '{print $2}'`; do
#			snam=`echo $module | sed -e 's/\(.*\).Mod/\1/g'`
#			short=`awk '/end-module-short-description/{p=0};p;/begin-module-short-description/{p=1}' "../$pkgn/$snam.Mod"`
#			# echo "* **$snam** : (something)" >> $2
#		        echo "   * - $snam " >> $2
#			echo "     - $short " >> $2
#		        #echo >> $2
#	done
#	echo >> $2
	echo "------------------------" >> $2
	echo "  Package Dependencies  " >> $2
	echo "------------------------" >> $2
	echo " " >> $2
	echo "$pdep" >>  $2
	echo >> $2
	echo "--------" >> $2
	echo "  About  " >> $2
	echo "--------" >> $2
	echo " " >> $2
	echo "$pabt" >>  $2
	echo >> $2
	echo "---------------------" >> $2
	echo "  Development Guide  " >> $2
	echo "---------------------" >> $2
	echo " " >> $2
	echo "$pkgn $pdev " >>  $2
	#echo >> $2
	#echo "=============================" >> $2
	#echo "  $pkgn Package Modules  " >> $2
	#echo "=============================" >> $2
	#echo " " >> $2

	
	
	echo "" >> $2
	echo "https://github.com/io-core/$pkgn/blob/main/$pkgn.Pkg" >> $2
}

function cronch {
local fnf="$1"
local fns="${fnf:0:-4}"
mv $fnf $fns.tmp
local i
local head="N"
for i in `awk '/toctree/{f=1;}f' $fns.tmp | tail -n +6 | awk '/^$/{exit};$1' | tr ' ' '&'` ; do
	local src=`echo $i | tr '&' ' ' | awk '{print $1;}'`
	local dst=`echo $i | tr '&' ' ' | awk '{print $2;}'`
#	echo  "for $fnf from $src to $dst "
	if [ "${dst:0:1}" == "[" ] ; then
		if [ -f "$src.Pkg" ] ; then
			if [ $head == "N" ] ; then
				head="Y"
				echo ".. list-table::  " >> "$fns.tmp"
				echo "   :widths: 20 80 " >> "$fns.tmp"
				echo "   :header-rows: 1 " >> "$fns.tmp"
				echo " " >> "$fns.tmp"
				echo "   * - Package " >> "$fns.tmp"
				echo "     - Description " >> "$fns.tmp"
			fi
			brrt "$src.Pkg" "${dst:1:-1}" "$fns.tmp"
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
cat $fns.tmp | sed -e 's/ *\(.*\)<\(.*\).rst>/   \2/g' > $fns2.tmp
cat $fns2.tmp | sed -e 's/ *\(.*\)\[\(.*\).rst\]/   \2/g' > $fnf

}


# generate the document root
awk '/end-documentation-root/{p=0};p;/begin-documentation-root/{p=1}' Doc.Mod > index.rst

# generate document nodes referenced from document root
cronch index.rst

#make clean; make html
#git add gen/* gen/*/* gen/*/*/* gen/*/*/*/* gen/*/*/*/*/*
#git commit -m 'regenerated odoc'
#git push origin

