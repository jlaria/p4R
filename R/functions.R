functions = '
# Functions to be used globally

wlog = function(text,...){
  cat(paste0(date(),"\t", text,...,"\n"), file="log.txt", append = T)
}


generate_data = function(R, N){
  foreach(run = 1:R)%:%
  foreach(n = N)%dopar%{
      x = rnorm(n)
      save(x, file = paste0("data/", run, "_", n,".RData"))
    }
}

compute = function(x, method){
  switch (method,
    mean = {
      out = mean(x)
    },
    median = {
      out = median(x)
    },
    sd = {
      out = sd(x)
    }
  )
  return(out)
}

'
