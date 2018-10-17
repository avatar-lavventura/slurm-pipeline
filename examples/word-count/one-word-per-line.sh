#!/bin/bash -e

[ -d output ] || mkdir output

out=output/one-word-per-line.out

echo "Args are $@" > $out
echo "SP_* env vars are:" >> $out
set | egrep '^SP_' | sed 's/^/  /' >> $out

# This is the first script to be run. On its command line it gets the
# (non-specification) arguments that were given to
# ../../bin/slurm-pipeline.py by the Makefile (i.e., texts/*.txt).

for file in "$@"
do
    task=`basename $file | cut -f1 -d.`
    jobid=$(sbatch $SP_DEPENDENCY_ARG $SP_NICE_ARG scripts/one-word-per-line_script.sh $file $task | cut -f4 -d' ')
    echo TASK: $task $jobid
done
