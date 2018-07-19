#!/bin/bash
#for the bedtools commands
#used after siteModification.R

csv_in=$1
bash_out=$2
transcriptome=$3
new_bash=$4
new_csv=$5

cat $csv_in | tr ',' '\t' > $bash_out
bedtools intersect -a $bash_out -b $transcriptome -u > $new_bash
cat $new_bash | tr '\t' ',' > $new_csv

#-u is for Report whether each alignment overlaps one or more genes. If not, the alignment is not reported.
#done