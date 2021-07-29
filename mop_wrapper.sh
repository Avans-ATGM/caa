#!/

# assign inputs
while getopts hi:r:a:o:f:z:q:m:y:c:x:p:w:b:d:v:t: option
do
case "${option}"
in 

#help
h) HELP=${OPTARG};;

# files
i) READS=${OPTARG};;
r) REFERENCE=${OPTARG};;
a) ANNOTATION=${OPTARG};;
o) OUTPUT=${OPTARG};;

# tools
f) NANOFILT=${OPTARG};;
z) NANOFILT_OPTION=${OPTARG};;
q) FASTQC=${OPTARG};;
m) MAPPING=${OPTARG};;
y) MAPPING_OPTION=${OPTARG};;
c) COUNTING=${OPTARG};;
x) COUNTING_OPTION=${OPTARG};;
p) NANOPLOT=${OPTARG};;
w) NANOPLOT_OPTION=${OPTARG};;
b) BAMSTATS=${OPTARG};;

# task cpus
t) TASK_CPUS=${OPTARG};;

esac
done

###########################################################################################################################
if [[ $# -eq 0 ]]; then
echo ""
echo -e "\e[31m No arguments supplied \e[39m"
echo " use bash mop_workflow.sh -h for more info"
echo ""
exit 0
fi
## checking inputs
. ./bin/bash/check/check_help.sh
echo ""
echo -e " <mop_wrapper> \e[34m checking inputs \e[39m"
. ./bin/bash/mop_check.sh

## showing parameters
echo ""
echo -e " <mop_wrapper> \e[34m showing parameters \e[39m"
echo ""
. ./bin/bash/mop_parameters.sh

## making temporary directory and moving files
echo ""
echo -e " <mop_wrapper> \e[34m making temporary directory and moving files \e[39m"
. ./bin/bash/mop_tempdir.sh

## running tools
echo ""
echo -e " <mop_wrapper> \e[34m running preprocessing module \e[39m"
. ./bin/bash/mop_preprocess.sh

## moving output folder and removing tempdir
echo ""
echo -e " <mop_wrapper> \e[34m moving results to output directory \e[39m"
. ./bin/bash/tempdir/tempdir_output.sh

## finished
echo ""
echo -e " <mop_wrapper> \e[34m process finished \e[39m"
echo ""