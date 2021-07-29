#!/bin/bash/check

## check file
echo -e " <mop_input> \e[33m output_folder:\e[39m (-o $OUTPUT)"

if [[ -z $OUTPUT ]]; then
	OUTPUT="output/output_mop.1"

	if test -d "output/output_mop"; then

		name=$OUTPUT
		path=$(dirname "$name")
		filename=$(basename "$name")
		filename="${filename%.*}"
		if [[ -e $path/$filename ]] ; then
    			i=
    			while [[ -e $path/$filename$i ]] ; do
        			let i++
    			done
    			filename=$filename$i
		fi
		target=$filename
		OUTPUT=$path/$target
	else
		OUTPUT="output/output_mop"
	fi	
else
OUTPUT="output/$OUTPUT"
fi
if test -d output/$OUTPUT; then
	echo -e " <mop_input> \e[31m ERROR \e[39m-o $OUTPUT \e[31malready exists! \e[39m"
	EXIT=yes

fi
echo -e " <mop_input> \e[32m output valid \e[39m"


