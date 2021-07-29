#!/bin/bash/check

## check file
echo -e " <mop_input> \e[33m $2:\e[39m ($1 $3)"

if [[ -z $3 ]]; then
        echo -e " <mop_input> \e[31m ERROR \e[39m $2 \e[31mnot given! \e[39m"
	EXIT=yes
else
	if test -f $3; then
        	echo -e " <mop_input> \e[32m $2 found\e[39m"
	else
        	echo -e " <mop_input> \e[31m ERROR \e[39m $2 \e[31mnot found! \e[39m"
        	EXIT=yes
	fi

	if [[ $3 == *.gz ]]; then
		zipped=yes
	else
		zipped=no
	fi
	echo -e " <mop_input> \e[32m $2 zipped:\e[39m $zipped"
fi



