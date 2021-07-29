#!/bin/bash/preprocess
# qc using bam2stats
bam2stats_output=$output_folder/bam2stats.txt
bash bin/bash/preprocess/bam2stats.sh $mapped_output $bam2stats_output $BAMSTATS

# qc using nanoplot
if [[ $NANOPLOT == yes ]]; then
	echo -e " <mop_preprocess> \e[33m QC of aligned reads with NanoPlot \e[39m"
	nanoplot_output=$output_folder/nanoplot
	NanoPlot --bam $mapped_output -o $nanoplot_output $NANOPLOT_OPTION -t $TASK_CPUS
	rm $mapped_output.bai
else
	echo -e " <mop_preprocess> \e[33m skipping QC with NanoPlot \e[39m"
fi
