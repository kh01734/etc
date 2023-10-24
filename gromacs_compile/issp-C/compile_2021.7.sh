#!/bin/bash
set -e

module purge 
module load \
	intel/2022.2.1 \
	intel-mpi/2021.7.1
#	openmpi_nvhpc/4.1.2 \
#	nvhpc-nompi/22.2 
#
thread=$1
PREFIX=$2
#module load \
#    oneapi_mkl/2023.0.0 \
#    oneapi_compiler/2023.0.0 \
#    oneapi_mpi/2023.0.0 \
#    openmpi/4.0.4-gcc-10.1.0
#

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
	-DCMAKE_C_COMPILER="mpiicc" \
	-DCMAKE_CXX_COMPILER="mpiicpc" \
	-DGMX_SIMD=AVX2_256 


#cmake .. \
#    -DGMX_MPI=ON \
#    -DCMAKE_INSTALL_PREFIX=$PREFIX \
#    -DGMX_GPU=OFF \
#    -DGMX_FFT_LIBRARY=fftw3 \
#    -DGMX_BUILD_OWN_FFTW=ON \
#    -DCMAKE_C_COMPILER=mpigcc \
#    -DCMAKE_CXX_COMPILER=mpic++ \
#    -DGMX_SIMD=AVX2_256
#
make -j $thread
#make check -j $thread
make install -j $thread

source ${PREFIX}/bin/GMXRC
echo "GROMACS install done" >&1
