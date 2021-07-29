#!/bin/bash/tempdir
# copying and unpacking file
file=$input_folder/$1.$2
# copying and if zipped unpacking
if [[ $3 == yes ]]; then
	echo -e " <mop_tempdir> \e[33m copying and unpacking $1 file into tempdir\e[39m"
	cp $4 $file.gz
	gunzip $file.gz
else
	echo -e " <mop_tempdir> \e[33m copying $1 file into tempdir\e[39m"
	cp $4 $file.gz
	mv $file.gz $file
fi