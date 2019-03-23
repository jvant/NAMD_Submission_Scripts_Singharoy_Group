#!/bin/bash

#SBATCH -N 1
#SBATCH -n 8
#SBATCH -p asinghargpu1
#SBATCH -q asinghargpu1
#SBATCH --gres=gpu:GTX1080:1
#SBATCH -o ./slurm.out

module load namd/2.13b1-cuda

namd2 +p8 ./CONFIGURATION_FILE.namd > ./CONFIGURATION_FILE.log
