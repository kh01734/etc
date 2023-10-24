#!/bin/sh
#PBS -q F1cpu
#PBS -l select=1:ncpus=128:mpiprocs=32:ompthreads=4
#PBS -l walltime=1:00:00
#PBS -N test

module purge
module load gcc/12.2.0
LD_LIBRARY_PATH=$MPIROOT/lib:$LD_LIBRARY_PATH
MANPATH=$MPIROOT/share/man:$MANPATH
export MPIROOT PATH LD_LIBRARY_PATH MANPATH
export PATH=$PATH:/home/k0055/k005530/apps/gromacs/2021.7-gcc12/bin
mpirun --version
which mpirun
mpirun -np 32 gmx_mpi mdrun -deffnm test -ntomp 4
