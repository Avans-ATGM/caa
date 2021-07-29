#!/bin/bash/preprocess
# filtering of raw reads
if [[ $FASTQC == yes ]]; then
	fastqc_folder=$output_folder/FastQC_report
	mkdir $fastqc_folder
	echo -e " <mop_preprocess> \e[33m quality control of raw reads with fastqc \e[39m"
	fastqc $sequence_file -o $fastqc_folder -d $tempdir -t $TASK_CPUS
	if [[ $NANOFILT == yes ]]; then
		echo -e " <mop_preprocess> \e[33m quality control of filtered reads with fastqc \e[39m"
		fastqc $nanofilt_output -o $fastqc_folder -d $tempdir -t $TASK_CPUS
	fi
elif [[ $FASTQC == no ]]; then
	echo -e " <mop_preprocess> \e[33m skipping quality control of reads \e[39m"
fi

	
