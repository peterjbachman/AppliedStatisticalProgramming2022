# This script comes from the devtoolsIntro from class

## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("./PS5") # Run once

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)

# check("integrateIt")


x = 1:5
y <- x^2
testX <- seq(1, 4, length.out = 4)
testY <- sin(testX)
integrateIt(x, y, 1, 3, "Trapezoid")
integrateIt(x, y, 2, 4, "Simpson")
integrateIt(testX, testY, 1, 4, "Simpson")
integrateIt(testX, testY, 1, 4, "Trapezoid")
