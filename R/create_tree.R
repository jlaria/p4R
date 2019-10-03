# Initalize directory and file structure

create_tree <- function(path, ...){

  # ensure path exists
  dir.create(path, recursive = T, showWarnings = F)

  # create path for data and results
  dir.create(paste0(path, "/data"), recursive = T, showWarnings = F)
  dir.create(paste0(path, "/results"), recursive = T, showWarnings = F)

  # populate path with initial scripts

  writeLines(body, con = file.path(path, "body.R"))
  writeLines(functions, con = file.path(path, "functions.R"))
  writeLines(main_script, con = file.path(path, "main_script.R"))
  writeLines(main_script_mpi, con = file.path(path, "main_script_mpi.R"))
  writeLines(mpi_run.sh, con = file.path(path, "mpi_run.sh"))
  writeLines(run.sh, con = file.path(path, "run.sh"))

}
