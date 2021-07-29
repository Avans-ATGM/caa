#!/bin/bash/preprocess
# aligning of reads
if [[ $MAPPING == no ]]; then
	echo -e " <mop_preprocess> \e[33m starting with aligned reads \e[39m"
	mapped_output=$input_folder/aligned_reads.bam
	mv $sequence_file $mapped_output

elif [[ $MAPPING == minimap2 ]]; then
	echo -e " <mop_preprocess> \e[33m aligning reads with minimap2 \e[39m"
	mapped_output=$output_folder/aligned_reads.bam

	minimap2 -t $TASK_CPUS $MAPPING_OPTION $reference_file $nanofilt_output -o $tempdir/file.bam	
	samtools view -@ $TASK_CPUS $tempdir/file.bam -F4 -hSb > $tempdir/reads.bam
	samtools sort -@ $TASK_CPUS -o $mapped_output $tempdir/reads.bam
	rm $tempdir/file.bam
	rm $tempdir/reads.bam

elif [[ $MAPPING == graphmap2 ]]; then
	echo -e " <mop_preprocess> \e[33m aligning reads with graphmap2 \e[39m"
	mapped_output=$output_folder/aligned_reads.bam

	graphmap2 align -t $TASK_CPUS $MAPPING_OPTION -r $reference_file -d $nanofilt_output -o $tempdir/file.bam
	samtools view -@ $TASK_CPUS $tempdir/file.bam -F4 -hSb > $tempdir/reads.bam
	samtools sort -@ $TASK_CPUS -o $mapped_output $tempdir/reads.bam
	rm $tempdir/file.bam
	rm $tempdir/reads.bam

fi
