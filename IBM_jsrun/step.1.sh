#!/bin/bash

## This script submits namd jobs on summit utilizing the non-memory optimized version of namd.
## Usage: bsub step.1.sh

#BSUB -P BIP115 ## Project ID (required)
#BSUB -W 3:00 ## Wall time (required)
#BSUB -nnodes 64 ## Number of requested nodes (required)
#BSUB -J step_1 ## Job name

module load spectrum-mpi
module load cuda
module load fftw

## When changing the number of nodes (-nnodes above), -n### below needs to be the product of 6 * -nnodes.  i.e. 6 * 64 = 384.  All other flags will remain the same.  These specify how namd utilizes the summit architecture.
jsrun -n384 -r6 -a1 -g1 -c7 -brs /ccs/home/jimp/summit/build_nov/namd/Linux-POWER-xlC.pamicuda/namd2 ./step1..inp +ppn 7 +pemap 0-83:4,88-171:4 +ignoresharing >& ./step1.log
