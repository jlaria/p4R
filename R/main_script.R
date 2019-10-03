main_script = '
# Main script
# Platform: Personal Computer
# Backend: doParallel

#---------------------------\
# Load common functions     |
#---------------------------/
source("functions.R")
#---------------------------|

#---------------------------\
# Parallel libraries        |
#---------------------------/
library(foreach)
library(doParallel)
nodes = detectCores()
cl = makeCluster(nodes/2) # Specify number of threads here...
registerDoParallel(cl)
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
stopCluster(cl)
#---------------------------|
'
