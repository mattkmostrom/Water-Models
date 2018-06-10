#!/bin/bash

#SBATCH --partition=cuda 
#SBATCH --reservation=bspace_gpu 
#SBATCH --ntasks-per-node=16 
##SBATCH --gres=gpu:2 /bin/bash

#SBATCH --mem-per-cpu=2048
##SBATCH --nodes=1
#SBATCH --job-name=SFG_stuff
##SBATCH -t hh:mm:ss
#SBATCH --time=48:00:00
##SBATCH --partition=circe
#SBATCH --mail-type=END
#SBATCH --mail-user=matthewmostrom@gmail.com
#SBATCH --output=runlog.log

module purge
module load compilers/gcc/7.3.0
module load mpi/openmpi/2.0.4 compilers/gcc/7.3.0

openmpi -np $SLURM_NTASKS /home/k/karl6/lammps/src/lmp_mpi -in lammps.in
