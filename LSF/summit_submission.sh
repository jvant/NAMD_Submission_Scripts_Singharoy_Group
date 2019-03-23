#!/bin/bash

#BSUB -P BIP115
#BSUB -W 6:00
#BSUB -nnodes 64 ## Number of Nodes
#BSUB -J JOB_NAME

module load spectrum-mpi
module load cuda
module load fftw

## Change -n### to nnodes times 6 for instance 6 x 64 = 192 Thes rest of jsrun flags will always stay the same on summit
jsrun -n192 -r6 -a1 -g1 -c7 -brs /ccs/home/jimp/summit/build_nov/namd/Linux-POWER-xlC.pamicuda/namd2 ./CONFIGURATION_FILE.inp +ppn 7 +pemap 0-83:4,88-171:4 +ignoresharing > ./CONFIGURATION_FILE.log
