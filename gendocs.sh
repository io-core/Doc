#!/bin/bash

echo "# Core packages" > core/README.md
echo >> core/README.md
rm -f core/*/README.md
echo "# Standard Library Packages" > stdlib/README.md
echo >> stdlib/README.md
rm -f stdlib/*/README.md
echo "# Experimental Library Packages" >  explib/README.md
echo >>  explib/README.md
rm -f explib/*/README.md
for i in `ls -d ../src/github.com/io-core/*`; do 
	for j in `ls $i/*.Pkg 2>/dev/null`; do 
		k=`grep '^doc' $j | awk -F',' '{print $2}'`
		pkgdesc=`grep '^doc' $j | awk -F',' '{print $3}'`
		ref=`echo $j | sed -e 's/...src.github.com.io-core.\(.*\).Pkg/\1/g'` 
		nam=`echo $ref | awk -F'/' '{print $1}'` 
		#echo "$nam $ref $k $j $i"
		echo "[$nam](./$nam/README.md) $pkgdesc" >> $k/README.md
		echo >> $k/README.md
                echo "## $nam" >> $k/$nam/README.md
		echo "This package $pkgdesc" >> $k/$nam/README.md
		echo >> $k/$nam/README.md
		for l in `grep '^p,' $j | awk -F',' '{print $2}'`; do
			snam=`echo $l | sed -e 's/\(.*\).Mod/\1/g'`
			echo  >> $k/$nam/README.md
			echo  > $k/$nam/$snam.md
                        awk '/end-package-description/{p=0};p;/begin-package-description/{p=1}' ../src/github.com/io-core/$nam/$snam.Mod >> $k/$nam/README.md
                        echo  >> $k/$nam/README.md
			echo "#### [MODULE $snam](https://github.com/io-core/doc/blob/main/$k/$nam/$snam.md) [(source)](https://github.com/io-core/$nam/blob/main/$snam.Mod)" >> $k/$nam/README.md
                        awk '/end-module-use-description/{p=0};p;/begin-module-use-description/{p=1}' ../src/github.com/io-core/$nam/$snam.Mod >> $k/$nam/README.md
			echo "## [MODULE $snam](https://github.com/io-core/$nam/blob/main/$snam.Mod)" >> $k/$nam/$snam.md
                        awk '/end-module-develop-description/{p=0};p;/begin-module-develop-description/{p=1}' ../src/github.com/io-core/$nam/$snam.Mod >> $k/$nam/$snam.md
			echo  >> $k/$nam/README.md
			echo  >> $k/$nam/$snam.md
			echo "Procedures:" >> $k/$nam/README.md
                        echo '```' >> $k/$nam/README.md
			echo "../src/github.com/io-core/$nam/$snam.Mod" 
			for p in `grep "PROCEDURE" ../src/github.com/io-core/$nam/$snam.Mod | grep '*;\|*(\|* (' | sed -e 's/ *PROCEDURE \(.*\);/\1/g'|tr ' ' '~'`; do
				echo "  `echo $p | tr '~' ' '`" >> $k/$nam/README.md
			        echo  >> $k/$nam/README.md	
			done
                        echo '```' >> $k/$nam/README.md

			echo "Procedures:" >> $k/$nam/$snam.md
                        echo  >> $k/$nam/$snam.md
			echo "../src/github.com/io-core/$nam/$snam.Mod"
			awk '/end-procedure-description/{p=0};p;/begin-procedure-description/{p=1};/end-section-description/{q=0};q;/begin-section-description/{q=1};/^ *PROCEDURE/{print "[(src)](https://github.com/io-core/~~~nam~~~/blob/main/~~~snam~~~.Mod#L"NR") `"$0"`"}' ../src/github.com/io-core/$nam/$snam.Mod | sed -e "s/~~~nam~~~/$nam/g" | sed -e "s/~~~snam~~~/$snam/g" >> $k/$nam/$snam.md	
                        

		done
	done
done
