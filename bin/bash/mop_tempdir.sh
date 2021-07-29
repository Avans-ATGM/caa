#!/bin/bash
echo""
# making tempdir
. ./bin/bash/tempdir/tempdir_making.sh

# copying and if zipped unpacking sequence file into tempdir
. ./bin/bash/tempdir/tempdir_copyunpack.sh "raw_reads" "fastq" $sequence_zipped $READS
sequence_file=$file

# copying and if zipped unpacking reference file into tempdir
if [[ $MAPPING != no ]]; then
	. ./bin/bash/tempdir/tempdir_copyunpack.sh "reference" "fasta" $reference_zipped $REFERENCE
	reference_file=$file
fi

# copying and if zipped unpacking annotation file into tempdir
if [[ $COUNTING != no ]]; then
	. ./bin/bash/tempdir/tempdir_copyunpack.sh "annotation" "gtf" $annotation_zipped $ANNOTATION
	annotation_file=$file
fi