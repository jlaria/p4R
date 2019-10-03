mpi_run.sh = '
#!/bin/sh

mpirun -np $1 -hostfile ~/mpi/host.info R --slave -f main_script_mpi.R 2>&1 | tee output.txt &
'
