#!/bin/bash

## parameters
echo " <mop_parameters> input:	$READS"
if [[ $MAPPING != no ]]; then
	echo " <mop_parameters> reference:	$REFERENCE"
fi
if [[ $COUNTING != no ]]; then
	echo " <mop_parameters> annotation:	$ANNOTATION"
fi
echo " <mop_parameters> output:	$OUTPUT"
echo ""
echo " <mop_parameters> cpus:		$TASK_CPUS"
echo""
if [[ $NANOFILT != no ]]; then
	echo " <mop_parameters> nanofilt:	$NANOFILT 		($NANOFILT_OPTION)"
else
	echo " <mop_parameters> nanofilt:	$NANOFILT"
fi
echo " <mop_parameters> fastqc:	$FASTQC"
if [[ $MAPPING != no ]]; then
	echo " <mop_parameters> mapping:	$MAPPING 	($MAPPING_OPTION)"
else
	echo " <mop_parameters> mapping:	$MAPPING"
fi
if [[ $COUNTING != no ]]; then
	echo " <mop_parameters> counting:	$COUNTING 	($COUNTING_OPTION)"
else
	echo " <mop_parameters> counting:	$COUNTING"
fi
echo " <mop_parameters> bam2stats:	$BAMSTATS"

if [[ -z $NANOPLOT_OPTION ]]; then
	echo " <mop_parameters> NanoPlot:	$NANOPLOT"
elif [[ $NANOPLOT == no ]]; then
	echo " <mop_parameters> NanoPlot:	$NANOPLOT"
else
	echo " <mop_parameters> NanoPlot:	$NANOPLOT	($NANOPLOT_OPTION)"
fi
if [[ $DESEQ != no ]]; then
	echo " <mop_parameters> DESeq:	$DESEQ 		($DESEQ_OPTION)"
else
	echo " <mop_parameters> DESeq:	$DESEQ"
fi
