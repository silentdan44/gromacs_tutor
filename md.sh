#!/bin/bash

#SBATCH -p hpc5-el7-gpu-3d
#SBATCH -J gromacs              
#SBATCH -o grom.%j.out       
#SBATCH -e grom.%j.err        
#SBATCH -N 1                  
#SBATCH -n 1               
#SBATCH --exclusive
#SBATCH --gres=gpu:1

module purge
module load gromacs/2021

mpirun -n 1 gmx_mpi mdrun -rdd 2.1 -ntomp 1 -deffnm md_0_1 -nb gpu

