#!/bin/bash/preprocess
# parameters
echo "input:		$READS"
if [[ $MAPPING != no ]]; then
	echo "reference:	$REFERENCE"
fi
if [[ $COUNTING != no ]]; then
	echo "annotation:	$ANNOTATION"
fi
echo "output:		$OUTPUT"
echo ""
echo "cpus:		$TASK_CPUS"
echo""
if [[ $NANOFILT != no ]]; then
	echo "nanofilt:	$NANOFILT 		($NANOFILT_OPTION)"
else
	echo "nanofilt:	$NANOFILT"
fi
echo "fastqc:		$FASTQC"
if [[ $MAPPING != no ]]; then
	echo "mapping:	$MAPPING 	($MAPPING_OPTION)"
else
	echo "mapping:	$MAPPING"
fi
if [[ $COUNTING != no ]]; then
	echo "counting:	$COUNTING 	($COUNTING_OPTION)"
else
	echo "counting:	$COUNTING"
fi
echo "bam2stats:	$BAMSTATS"
if [[ -z $NANOPLOT_OPTION ]]; then
	echo "NanoPlot:	$NANOPLOT"
elif [[ $NANOPLOT == no ]]; then
	echo "NanoPlot:	$NANOPLOT"
else
	echo "NanoPlot:	$NANOPLOT	($NANOPLOT_OPTION)"
fi
if [[ $DESEQ != no ]]; then
	echo "DESeq:	$DESEQ 		($DESEQ_OPTION)"
else
	echo "DESeq:		$DESEQ"
fi
