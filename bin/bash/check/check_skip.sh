#!/bin/bash/check

# skip mapping
if [[ $MAPPING == no ]]; then
        NANOFILT="no"
	NANOFILT_OPTION="skip"
	FASTQC="no"
fi

# count with nanocount
if [[ $COUNTING == nanocount ]]; then
	ANNOTATION="not required"
	annotation_zipped=""
elif [[ $COUNTING == no ]]; then
	ANNOTATION="not required"
	annotation_zipped=""
fi