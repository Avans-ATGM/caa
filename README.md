**ONT-RNA-Sequencing**

_Made by mop and honhon_

Long-read genome sequencing is being used more and more in the past decade. With it, the need for consistent data analysing tools has increased. However, the knowledge needed to correctly use these tools has increased at the same pace. This hinders general access and use-cases for the technique. Therefore, we present our workflow.

The produced workflow includes all steps needed to do the preprocessing of FASTQ files produced by Nanopore direct RNA sequencing for later downstream processing except for quality control of the raw and trimmed data. It allows users a choice of different tools with an option to change their settings manually or use the basic settings. This makes it easier for the general user to analyze Nanopore direct RNA-seq data. 

****

The data used to test this pipeline is included in the repository. The article the data is taken from is as follows:

Exploring prokaryotic transcription, operon structures, rRNA maturation and modifications using Nanopore-based native RNA sequencing
Felix Grünberger, Robert Knüppel, Michael Jüttner, Martin Fenk, Andreas Borst, Robert Reichelt, Winfried Hausner, Jörg Soppa, Sébastien Ferreira-Cerca, Dina Grohmann
bioRxiv 2019.12.18.880849; doi: https://doi.org/10.1101/2019.12.18.880849

The created pipeline consists of two parts: preprocess and differential expression analysis. Preprocess is always the first step that needs to be performed. For this the following usage is included. When wanting to call the bash script of this workflow please use the following usage as documentation:

	 Don't forget to install and activate the conda environment before running the workflow otherwise the tools won't work properly.

	 Bash mop_wrapper.sh 	[-h] [-o <name>]
				[-i <file>] [-r <file>] [-a <file>]
				[-f yes | no] [-q yes | no] [-m minimap2 | graphmap2 | no] 
				[-c nanocount | htseqcount | no] [-p yes | no] [-b yes | no]
				[-z "options"] [-y "options"] [-x "options"] [-w "options"]

	 General options:
	  -h		show mop_usage.txt and exit
	  -o		Specify name of output folder (if not given workflow wil generate name automatically)

	 Input files:
	  -i		path to input.fastq
	  -r		path to reference.fasta
	  -a		path to annotation.gtf

	 Tool selections:
	  -f		Specify if reads should be filtered using NanoFilt or skipped		(yes (default) or no)
	  -q		Specify if QC of reads should be performed using FastQC	or skipped	(yes (default) or no)
	  -m		Specify mapping tool that will be used or start with aligned reads	(minimap2 (default), graphmap2 or no)
	  -c		Specify counting tool that wil be used or skipped			(featurecounts (default), htseqcount or no)
	  -p		Specify if QC of aligned reads with NanoPlot should be run or skipped	(yes (default) or no)
	  -b		Specify if QC of aligned reads with bam2stats should be run or skipped	(yes (default) or no)

	 Tool options:
	  -z "N"	Specify specific tool options inbetween " ", for NanoFilt 		(for usage use NanoFilt -h)
	  -y "N"	Specify specific tool options inbetween " ", for selected mapping tool 	(for usage use minimap2 -h or graphmap2 align -h)
	  -x "N"	Specify specific tool options inbetween " ", for selected counting tool	(for usage use featureCounts -h or htseq-count -h)
	  -w "N"	Specify specific tool options inbetween " ", for NanoPlot		(for usage use NanoPlot -h)

	
	
When having performed the preprocess the htseq-count or nanocount files can be accessed. If you want to perform differential expression analysis take the following steps into account:
	
	Move all count files to the following folder: ***deseq2/deseq_input/***
	Call the ***deseq2_run.sh*** file to perform differential expression analysis
	The script will create a new file: ***readCounts.csv*** which concatenates all count files into one file.
	The script will create a new folder: ***deseq2_output***: and place a output .pdf and .csv file in it.
	
If you want to perform another differential expression analysis please make sure the ***deseq_input*** folder does not include any files you do not want to take into consideration. Also, please remove any old ***readCounts.csv*** files as the program will not be able to perform a concatenation of the count files if a ***readCounts.csv*** already exists.
