How to install gromacs-2021.7 in issp-C

- 1. compile openMPI 4.1.6 with gcc/12.2.0
- 2. compile gromacs 2021.7

- Note that this compilation method does not enable gromacs to run in multiple nodes(but mpitun within 1 node is enabled).
- In my system, "mpirun -np 16 gmx_mpi mdrun -ntomp 8" was fastest within 1 node of 128 core.
