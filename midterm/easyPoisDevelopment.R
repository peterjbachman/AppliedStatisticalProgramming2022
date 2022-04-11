# This script comes from the devtoolsIntro from class
# This correctly runs when the project is set to the easyPois package
setwd("../") # Run once

## Load libraries and set working directory
library(devtools)
library(roxygen2)

## This can be run many times as the code is updates
current.code <- as.package("easyPois")
load_all(current.code)
document(current.code)
