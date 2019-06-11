#!/bin/sh
#this script is based on methods from "The complex sequence landscape of maize revealed by single molecule technologies" by Jiao et al http://biorxiv.org/content/early/2016/12/19/079004
#The GyDB database is used here (http://gydb.org/gydbModules/collection/collection/db/GyDB_collection.zip)
 
module load genometools
module load hmmer

#use LTRHarvest to find transposons in the scaffold
gt suffixerator -db $1.fasta.gz -indexname $1.fsa -v -tis -suf -lcp -des -ssp -sds -dna
gt ltrharvest -index $1.fsa -v -out pred-$1.fsa -outinner pred-inner-$1.fsa -gff3 pred-$1.gff3

#Use LTR digest to annotate them
gt ltrdigest -force -hmms ~/Nobt_Annotation_Link/ltr/gydb_hmms/GyDB_collection/profiles/*.hmm -o anno_$1.gff3  pred-$1.gff3 $1.fsa
