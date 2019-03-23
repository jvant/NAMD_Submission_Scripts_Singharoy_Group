#!/bin/bash

#Usage: bash jobpip.sh

#first job
#job1=$(bsub  a_1.6.1.sh  | cut -f 2 -d' ')
#echo $job1

#Dependent Jobs

job74=$(bsub -w 230353 a_0.7.4.summit.sh | cut -f 2 -d' ')
echo ${job74:1:6}
job75=$(bsub -w ${job74:1:6} a_0.7.5.summit.sh | cut -f 2 -d' ')
echo ${job75:1:6}
job76=$(bsub -w ${job75:1:6} a_0.7.6.summit.sh | cut -f 2 -d' ')
echo ${job76:1:6}
job77=$(bsub -w ${job76:1:6} a_0.7.7.summit.sh | cut -f 2 -d' ')
echo ${job77:1:6}
job78=$(bsub -w ${job77:1:6} a_0.7.8.summit.sh | cut -f 2 -d' ')
echo ${job78:1:6}
job79=$(bsub -w ${job78:1:6} a_0.7.9.summit.sh | cut -f 2 -d' ')
echo ${job79:1:6}
job710=$(bsub -w ${job79:1:6} a_0.7.10.summit.sh | cut -f 2 -d' ')
echo ${job710:1:6}

