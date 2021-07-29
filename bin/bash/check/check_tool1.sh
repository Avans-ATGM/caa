#!/bin/bash/check

## check tool
echo -e " <mop_input> \e[33m $2 option:\e[39m ($1 $7)"

if [[ -z $7 ]]; then
        tool="$3"
	tool_option="$5"

elif [[ $7 == $3 ]]; then
        tool="$3"
	tool_option="$5"

elif [[ $7 == $4 ]]; then
        tool="$4"
	tool_option="$6"

else
        echo -e " <mop_input> \e[31m ERROR $2 option not valid! \e[37m (can either be $3 (default), $4) \e[39m"
	EXIT=yes
fi
tool_file="not required"
echo -e " <mop_input> \e[32m $2 option valid \e[39m"
