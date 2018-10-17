#!/bin/bash -e

task=$1
out=output/long-words-$task.out

echo "Args are $@" > $out
echo "SP_* env vars are:" >> $out
set | egrep '^SP_' | sed 's/^/  /' >> $out

jobid=$(sbatch $SP_DEPENDENCY_ARG $SP_NICE_ARG scripts/one-word-per-line_script.sh $task | cut -f4 -d' ')
echo TASK: $task $jobid
