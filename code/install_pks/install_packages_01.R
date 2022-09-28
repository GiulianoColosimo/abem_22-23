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

if(!requireNamespace("Rqc", quietly = TRUE)) {
  BiocManager::install('Rqc', quiet = TRUE, update = FALSE, ask = FALSE, type = pkg_type)
}

if(!requireNamespace("DECIPHER", quietly = TRUE)) {
  BiocManager::install('DECIPHER', quiet = TRUE, update = FALSE, ask = FALSE, type = pkg_type)
}

if(!requireNamespace("fpeek", quietly = TRUE)) {
  BiocManager::install('fpeek', quiet = TRUE, update = FALSE, ask = FALSE, type = pkg_type)
}

