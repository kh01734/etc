# How to install GROMACS in issp-C

- GROMACS is not pre-compiled in ISSP system C. Here I introduce how to install gromacs in this supercomputer.\

## Method
<span style="color: red; ">**Change the Path in the following commands and scripts (".sh") to match yours.**</span>
1. compile openMPI 4.1.6 with gcc/12.2.0
```
bash compile_4.1.6.sh 2 /home/kxxxx/kxxxxxx/apps/openMPI/4.1.6 
```
2. compile gromacs 2021.7
```
bash compile_2021.7-gcc.sh 2 /home/kxxxx/kxxxxxx/apps/gromacs/2021.7
```

## Parallelization
- Note that this compilation method does not enable gromacs to run in multiple nodes (but mpirun within 1 node is enabled).
- In my system, it was fastest to run a simulation within 1 node of 128 core.  
```
mpirun -np 16 gmx_mpi mdrun -ntomp 8 -deffname brabra
```

## Notes
- You can compile 2022-6 in the same way by just changing 2021.7 to 2022.6 in the scripts
- I confirmed this script to work as of Oct. 2023.
- There is a possibility that it may turn to be unusable due to future update in the ISSP-systemC.
