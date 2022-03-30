# This script comes from the devtoolsIntro from class

## Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("./PS5")

## This can be run many times as the code is updates
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)

# check("integrateIt")


x = 1:5
y <- x^2
integrateIt(x, y, 1, 5, "Trapezoid")
