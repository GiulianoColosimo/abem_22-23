pkg_type <- switch(Sys.info()["sysname"],
                   "Linux" = "source", 
                   "both")

if(!requireNamespace("progress", quietly = TRUE)) {
  install.packages(c('progress'), quiet = TRUE, update = FALSE, ask = FALSE, type = pkg_type)
}


## BiocManager comes first!
## these packages are needed prior to the installation
if(!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages(c('BiocManager'), repos = "https://cloud.r-project.org",
                   quiet = TRUE, 
                   update = FALSE, 
                   ask = FALSE, 
                   type = pkg_type)
}

if(!requireNamespace("remotes", quietly = TRUE)) {
  install.packages(c('remotes'), quiet = TRUE, update = FALSE, ask = FALSE, type = pkg_type)
}

if(!requireNamespace("magrittr", quietly = TRUE)) {
  BiocManager::install('magrittr', quiet = TRUE, update = FALSE, ask = FALSE, type = pkg_type)
}
