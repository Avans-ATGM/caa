#!/bin/bash/tempdir
# copying output folder to dir and removing tempdir
if [[ ! -d output ]]; then
	echo -e " <mop_output> \e[33m making output folder \e[39m"
	mkdir output   
fi
echo -e " <mop_output> \e[33m moving output files to: \e[39m$OUTPUT"
mv $output_folder $OUTPUT
echo -e " <mop_output> \e[33m removing tempdir \e[39m"
rm -r $tempdir
echo ""
