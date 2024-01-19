#!/bin/bash
set -e

module purge 
module load gcc/12.2.0
MPIROOT=/home/kxxxx/kxxxxxx/openMPI/4.1.6
PATH=$MPIROOT/bin:$PATH
LD_LIBRARY_PATH=$MPIROOT/lib:$LD_LIBRARY_PATH
MANPATH=$MPIROOT/share/man:$MANPATH
export MPIROOT PATH LD_LIBRARY_PATH MANPATH
thread=$1
PREFIX=$2

if [ -z $thread ] || [ -z $PREFIX ]; then
    echo "thread number and prefix must be inputed" >&2
    exit 1
fi

# gromacs version: 2022.5
URL="https://ftp.gromacs.org/gromacs/gromacs-2021.7.tar.gz"
wget $URL
tar -zxvf gromacs-2021.7.tar.gz
rm -f gromacs-2021.7.tar.gz
cd gromacs-2021.7
mkdir build
cd build


cmake .. \
	-DGMX_MPI=ON \
	-DCMAKE_INSTALL_PREFIX=$PREFIX \
	-DGMX_GPU=OFF \
	-DGMX_FFT_LIBRARY=fftw3 \
	-DGMX_BUILD_OWN_FFTW=ON \
	-DCMAKE_C_COMPILER="mpicc" \
	-DCMAKE_CXX_COMPILER="mpic++" \
	-DGMX_SIMD=AVX2_256 


make -j $thread
make install -j $thread

source ${PREFIX}/bin/GMXRC
echo "GROMACS install done" >&1
