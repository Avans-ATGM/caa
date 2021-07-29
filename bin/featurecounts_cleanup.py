#!/bin
# filters and merges the count and summary files from featureCounts
# usage: featurecount_cleanup.py <countfile> <summaryfile> <outputfile>

import getopt, sys
full_cmd_arguments = sys.argv
argument_list = full_cmd_arguments[1:]
########################################################################################################################
COUNT = f"{argument_list[0]}"
SUMMARY = f"{argument_list[1]}"
OUTPUT = f"{argument_list[2]}"
########################################################################################################################
# opening COUNT
with open(COUNT, 'r') as count_file:
    count = count_file.readlines()

# filtering COUNT
count = count[2:]
count2 = []
for n in count:
    n = n.split('\t')
    n = f"{n[0]}\t{n[-1]}"
    count2.append(n)
count = ''.join(count2)

# opening SUMMARY
with open(SUMMARY, 'r') as summary_file:
    summary = summary_file.readlines()

# filtering SUMMARY
summary = summary[1:]
summary2 = []
for n in summary:
    n = f"__{n}"
    summary2.append(n)
summary = ''.join(summary2)

# writing in new file
with open(OUTPUT, 'w') as output_file:
    output_file.write(f"{count}{summary}")