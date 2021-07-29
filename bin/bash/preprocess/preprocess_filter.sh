#!/bin/bash/preprocess
# filtering of raw reads
if [[ $NANOFILT == yes ]]; then
	echo -e " <mop_preprocess> \e[33m filtering reads with NanoFilt \e[39m"
	nanofilt_output=$output_folder/filtered_reads.fastq
	NanoFilt $sequence_file $NANOFILT_OPTION > $nanofilt_output
elif [[ $NANOFILT == no ]]; then
	echo -e " <mop_preprocess> \e[33m skipping filtering of reads \e[39m"
	nanofilt_output=$sequence_file
fi

	
