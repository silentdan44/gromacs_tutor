#!/bin/bash

#SBATCH -p hpc4-el7-gpu-3d
#SBATCH -J gromacs              
#SBATCH -o grom.%j.out       
#SBATCH -e grom.%j.err        
#SBATCH -N 1                  
#SBATCH -n 6               
#SBATCH --exclusive
#SBATCH --gres=gpu:6

module purge
module load gromacs/2021

mpirun -n 6 gmx_mpi mdrun -deffnm md_0_1 -nb gpu
