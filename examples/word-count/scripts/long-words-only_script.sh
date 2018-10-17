#!/bin/bash
#SBATCH -o slurm.out        # STDOUT
#SBATCH -e slurm.err        # STDERR
#SBATCH --mail-type=ALL

task=$1
awk 'length($0) > 5' < output/$task.words > output/$task.long-words
