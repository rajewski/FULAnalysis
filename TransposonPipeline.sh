#!/bin/sh
module load genometools

gt suffixerator -db scaffold584.fasta.gz -indexname scaffold584.fsa -tis -suf -lcp -des -ssp -sds -dna
gt ltrharvest -index scaffold584.fsa -v -out pred-scaffold584.fsa -outinner pred-inner-scaffold584.fsa
