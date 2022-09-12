pkg_type <- switch(Sys.info()["sysname"],
                   "Linux" = "source", 
                   "both")

installer_with_progress <- function(pkgs) {
  
  if(length(pkgs) == 0) { invisible(return(NULL)) }
  
  toInstall <- pkgs
  bp <- progress::progress_bar$new(total = length(toInstall),
                                   format = "Installed :current of :total (:percent ) - current package: :package",
                                   show_after = 0,
                                   clear = FALSE)
  
  length_prev <- length(toInstall)
  fail <- NULL
  while(length(toInstall)) {
    pkg <- toInstall[1]
    bp$tick(length_prev - length(toInstall),  tokens = list(package = pkg))
    length_prev <- length(toInstall)
    tryCatch(
      suppressMessages( BiocManager::install(pkg, quiet = TRUE, update = FALSE, ask = FALSE, type = "binary") ),
      error = function(e) { fail <<- c(fail, pkg) },
      warning = function(w) { fail <<- c(fail, pkg) },
      ## remove current package, otherwise we loop in event of failure
      ## update the list to reflect any dependencies that are now installed
      finally = { toInstall <- setdiff(toInstall, installed.packages()[, "Package"]) }
    )
  }
  bp$tick(length_prev - length(toInstall),  tokens = list(package = "DONE!"))
  
  return(fail)
}

download.file("https://github.com/GiulianoColosimo/abem_22-23/blob/main/test.rds?raw=true",
              destfile =  "test2.rds",
              method = "auto")

pkgs <- readRDS("test2.rds")

installer_with_progress(pkgs)