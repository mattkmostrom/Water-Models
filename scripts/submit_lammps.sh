#!/bin/bash
 
#SBATCH --mem-per-cpu=2048
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --job-name=SFG_stuff
#SBATCH --time=48:00:00
#SBATCH --partition=circe
#SBATCH --mail-type=END
#SBATCH --mail-user=matthewmostrom@gmail.com
#SBATCH --output=runlog.log
 
module purge
module load compilers/gcc/7.3.0
module load mpi/openmpi-1.4.1/gcc-4.4.2
#module load apps/lammps/16Feb16
##module load mpi/openmpi/1.4.1
 
mpd &
mpirun -np $SLURM_NTASKS /home/k/karl6/lammps/src/lmp_mpi -in lammps.in
#mpirun -np $SLURM_NTASKS lmp_mpi -in lammps.in

#mpirun /home/k/karl6/lammps/src/lmp_mpi -in lammps.in
