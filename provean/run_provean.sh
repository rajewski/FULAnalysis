#!/bin/bash -l
#SBATCH --ntasks=10
#SBATCH --nodes=1
#SBATCH --mem=1G
#SBATCH --time=01:00:00
#SBATCH --mail-user=araje002@ucr.edu
#SBATCH --mail-type=ALL
#SBATCH -p batch
#SBATCH -o slurm-%A.out
set -euv

# $((SLURM_MEM_PER_NODE/1000))'G'
# $SLURM_NTASKS

module load provean
# the --supporting_set FUL1support.txt option is used to speed testing, but given inconsistent results
provean.sh -q FUL2.fasta -v FUL2.vars --num_threads $SLURM_NTASKS
