body = '
#---------------------------------------\
# Log file                              |
#---------------------------------------/
writeLines(c(""), "log.txt")
wlog("Starting simulations")
wlog("Cluster intialized successfully!")
#---------------------------------------|


#---------------------------------------\
# Global libraries                      |
#---------------------------------------/
packages = c("base")
sapply(packages, function(l){library(l, character.only = TRUE)})
#---------------------------------------|


#---------------------------------------\
# Parameters                            |
#---------------------------------------/
set.seed(0)
R = 3 # runs
methods = c("mean", "median", "sd")
N = c(20, 25, 30, 100)
#---------------------------------------|


#---------------------------------------\
# Generate data                         |
#---------------------------------------/
wlog("Generating data...")
generate_data(R, N) #This
#---------------------------------------|


#---------------------------------------\
# Parallel loop                         |
#---------------------------------------/
wlog("Entering foreach loop")

results = foreach(run = 1:R, .packages = packages, .combine = "rbind")%:%
  foreach(n = N, .packages = packages, .combine = "rbind")%:%
  foreach(method = methods, .packages=packages, .combine = "rbind")%dopar%{

    # Load data
    load(paste0("data/", run, "_", n,".RData"))

    out = compute(x, method)

    wlog("method: ", method, " run: ", run, " output: ", out)

    data.frame(method = method,
               run = run,
               N = n,
               output = out)
  }

wlog("Simulations finished!")
#---------------------------------------|

'


