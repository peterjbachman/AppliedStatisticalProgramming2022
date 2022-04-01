# This script comes from the devtoolsIntro from class

## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("../") # Run once

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)

# check("integrateIt")


fun <- function(x){
  return(sin(x))
}
test <- integrateIt(fun, 1, 3, 5,"Trapezoid")
test <- integrateIt(fun, 1, 3, 5,"Simpson")

print(test$EstType)
print(test2$EstType)
