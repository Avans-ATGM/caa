#!/bin/bash/tempdir
# making tempdir
echo -e " <mop_tempdir> \e[33m making temp directory \e[39m"
tempdir=tempdir_mop
input_folder=$tempdir/input
output_folder=$tempdir/output
mkdir $tempdir
mkdir $input_folder
mkdir $output_folder
