if(Sys.info()["sysname"] == "Windows"){
  BiocManager::install(version = "devel")
  BiocManager::install("Rqc")
} else {
  BiocManager::install("Rqc")
}