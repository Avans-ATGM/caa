#!/bin
# qc using bam2stats
if [[ $3 == yes ]]; then
	echo -e " <mop_preprocess> \e[33m QC of aligned reads with bam2stats \e[39m"
	python ./bin/bam2stats.py $1 > $2
else
	echo -e " <mop_preprocess> \e[33m skipping QC with bam2stats \e[39m"
fi