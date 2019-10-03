main_script_mpi = '
# Main script
# Platform: Cluster with Message Passing Interface (i.e. openmpi, mpich2 ...)
# Backend: doMPI

#---------------------------\
# Load common functions     |
#---------------------------/
source("functions.R")
#---------------------------|

#---------------------------\
# Parallel libraries        |
#---------------------------/
library(foreach)
library(Rmpi)
library(doMPI)
cl <- startMPIcluster() # No need to specify number of processes...
registerDoMPI(cl)
#---------------------------|

#---------------------------\
# Main script               |
#---------------------------/
source("body.R")
#---------------------------|

#---------------------------\
# Save results              |
#---------------------------/
save.image("results/results.RData")
wlog("Results saved")
wlog("THe END")

closeCluster(cl)
mpi.quit()
#---------------------------|
'
