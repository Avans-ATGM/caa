#!/bin/bash
## check files
echo ""
echo -e " <mop_input> \e[34m 	   **files** \e[39m"

# input
. ./bin/bash/check/check_file.sh "-i" "input_file" $READS
sequence_zipped=$zipped

# reference
if [[ $MAPPING != no ]]; then
	. ./bin/bash/check/check_file.sh "-r" "reference_file" $REFERENCE
	reference_zipped=$zipped
fi

# annotation
if [[ $COUNTING != no ]]; then
	. ./bin/bash/check/check_file.sh "-a" "annotaion_file" $ANNOTATION
	annotation_zipped=$zipped
fi

# output folder
. ./bin/bash/check/check_output.sh

## task cpus
. ./bin/bash/check/check_between.sh "-t" "task cpus" 4 1 16 $TASK_CPUS
TASK_CPUS=$cpus

## check tools
echo ""
echo -e " <mop_input> \e[34m 	   **tools** \e[39m"

# nanofilt
. ./bin/bash/check/check_tool1.sh "-f" NanoFilt yes no "-q 0 --headcrop 5 --tailcrop 3" "" $NANOFILT
NANOFILT=$tool
if [[ -z $NANOFILT_OPTION ]]; then
	NANOFILT_OPTION=$tool_option
fi

# fastqc
. ./bin/bash/check/check_tool1.sh "-q" FastQC yes no "yes" "no" $FASTQC
FASTQC=$tool

# mapping
. ./bin/bash/check/check_tool2.sh "-m" mapping_tool minimap2 graphmap2 no "-ax map-ont -p 0 -N 10" "-x rnaseq" "skip" $MAPPING
MAPPING=$tool
if [[ -z $MAPPING_OPTION ]]; then
	MAPPING_OPTION=$tool_option
fi

# counting
. ./bin/bash/check/check_tool2.sh "-c" counting_tool featurecounts htseqcount no "-t exon -g ID -L" "--type exon --idattr ID --stranded no -a 0" "skip" $COUNTING
COUNTING=$tool
if [[ -z $COUNTING_OPTION ]]; then
	COUNTING_OPTION=$tool_option
	if [[ -z $ANNOTATION ]]; then
		ANNOTATION=$tool_file
	fi
fi

# bam2stats
. ./bin/bash/check/check_tool1.sh "-b" bam2stats yes no "" "skip" $BAMSTATS
BAMSTATS=$tool

# nanoplot
. ./bin/bash/check/check_tool1.sh "-p" NanoPlot yes no "" "skip" $NANOPLOT
NANOPLOT=$tool
if [[ -z $NANOPLOT_OPTION ]]; then
	NANOPLOT_OPTION=$tool_option
fi

## skipping steps
. ./bin/bash/check/check_skip.sh

## exit
if [[ $EXIT == yes ]]; then
	echo ""
	echo -e " <mop_input> \e[31m one or multiple inputs invalid!\e[39m"
	echo -e " <mop_input> \e[31m EXITING WORKFLOW! \e[39m"
	echo ""
        exit 0
fi