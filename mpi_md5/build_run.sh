mpicxx -o md5_cracker md5_cracker.cpp
mpiexec -n 12 ./md5_cracker
