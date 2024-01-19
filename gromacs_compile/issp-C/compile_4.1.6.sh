#!/bin/bash
set -e 

wget https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.6.tar.gz
tar -xzvf openmpi-4.1.6.tar.gz


module purge
module load gcc/12.2.0

if [ -z "4.1.6" ];then
	mkdir 4.1.6
fi
cd openmpi-4.1.6
./configure --prefix="/home/kxxxx/kxxxxxx/openMPI/4.1.6" CC=gcc CXX=g++ F77=gfortran FC=gfortran 
make
make install



