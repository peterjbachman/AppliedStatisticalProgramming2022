library(devtools)
library(EBMAforecast)

# required the project to be the one located in the package
load_all()

# Set up required data
df <- presidentialForecast
x <- df[,1:6]
y <- df[,7]
wHat <- replicate(dim(x)[2],1/dim(x)[2])

# zHat calculated the predicted z-values for the models and observations
zHat <- zHat(as.matrix(x), y, wHat, 1)
zHat

# wHat calculates the new weights given the zHat values
weights <- wHat(zHat)
weights

# rcppEBMA calculates these things and stops when the new weights and old
# weights are within a threshold.
rcppEBMA(as.matrix(x), y, wHat, 1, 0.00005)
