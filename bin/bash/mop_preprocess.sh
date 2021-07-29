#!/bin/bash
echo""
## writing parameters into file
echo -e " <mop_preprocess> \e[33m writing parameters into file\e[39m"
. ./bin/bash/preprocess/preprocess_parameters.sh > $output_folder/parameters.txt

## running tools
if [[ $MAPPING != no ]]; then
	# filtering of raw reads
	. ./bin/bash/preprocess/preprocess_filter.sh

	# fastqc of reads
	. ./bin/bash/preprocess/preprocess_fastqc.sh

fi

# aligning of reads
. ./bin/bash/preprocess/preprocess_align.sh

# counting of aligned reads
. ./bin/bash/preprocess/preprocess_count.sh

# quality control of aligned reads
. ./bin/bash/preprocess/preprocess_stats.sh