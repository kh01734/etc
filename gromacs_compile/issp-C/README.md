# How to install in issp-C

<span style="color: red; ">**Change the Path in the following commnds and scripts to match yours.**</span>
1. compile openMPI 4.1.6 with gcc/12.2.0
```
bash compile_4.1.6.sh 2 /home/k0055/k005530/apps/openMPI/4.1.6 
```
2. compile gromacs 2021.7
```
bash compile_2021.7-gcc.sh 2 /home/k005530/apps/gromacs/2021.7
```

- Note that this compilation method does not enable gromacs to run in multiple nodes(but mpitun within 1 node is enabled).
- In my system, was fastest within 1 node of 128 core.  
```
mpirun -np 16 gmx_mpi mdrun -ntomp 8 -deffname brabra
```
- You can compile 2022-6 by just changing 2021.7 to 2022.6 in the scripts
