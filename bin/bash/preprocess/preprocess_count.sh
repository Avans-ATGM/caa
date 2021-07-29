#!/bin/bash/preprocess
# counting aligned reads
if [[ $COUNTING == no ]]; then
	echo -e " <mop_preprocess> \e[33m skipping counting of aligned reads \e[39m"
elif [[ $COUNTING == featurecounts ]]; then
	echo -e " <mop_preprocess> \e[33m counting aligned reads with featurecount \e[39m"
	count_output=$tempdir/count.txt
	featureCounts -T $TASK_CPUS -a $annotation_file $COUNTING_OPTION -o $count_output $mapped_output
	bash bin/bash/preprocess/featurecounts_cleanup.sh $count_output $count_output.summary $output_folder/count.tsv
elif [[ $COUNTING == htseqcount ]]; then
	echo -e " <mop_preprocess> \e[33m counting aligned reads with htseqcount \e[39m"
	count_output=$output_folder/count.tsv
	htseq-count -f bam $COUNTING_OPTION $mapped_output $annotation_file > $count_output
fi
