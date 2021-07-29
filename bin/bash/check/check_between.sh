#!/bin/bash/check

## check task cpus
echo -e " <mop_input> \e[33m $2 option:\e[39m ($1 $6)"
if [[ -z $6 ]]; then
        cpus=$3
elif [[ $6 -ge $4 && $6 -le $5 ]]; then
	cpus=$6
else
        echo -e " <mop_input> \e[31m ERROR CPUS option \e[39m-t $CPUS\e[31m not valid! \e[37m :can be between $4 and $5 (default = $3)."
	EXIT=yes
fi
echo -e " <mop_input> \e[32m $2 option valid \e[39m"