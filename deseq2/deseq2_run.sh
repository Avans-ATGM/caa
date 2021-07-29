#!/bin/bash

mkdir deseq2_output/

python merge_and_to_csv.py


Rscript deseq2.R

mv deseq2_output.csv ./deseq2_output/
mv Rplots.pdf ./deseq2_output/




