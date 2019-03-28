#!/bin/bash

# This wrapper will submit jobs in a serialized order on summit.  Here we use the -w flag in order to specify the dependency of the next step on the previous step.
# Usage: bash jobpip.sh

#first job
job=$(bsub step.1.sh  | cut -f 2 -d' ')
echo ${job:1:6}

#Dependent Jobs
for i in {3..10} 
do
job=$(bsub -w ${job:1:6} step.$i.sh | cut -f 2 -d' ')
echo ${job:1:6}
done


