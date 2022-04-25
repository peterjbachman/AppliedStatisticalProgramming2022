df <- EBMAforecast::presidentialForecast
x <- df[,1:6]
y <- df[,7]
wHat <- replicate(dim(x)[2],1/dim(x)[2])


zHat <- ebmaRcpp::zHat(as.matrix(x), y, wHat, 1)
zHat

weights <- ebmaRcpp::wHat(zHat)

rCppEBMA(as.matrix(x), y, wHat, 1, 2)

dnorm(44.5948, 0.0192778, 1, FALSE)

for (i in 1:5)
weightsNew <- rCppEBMA(as.matrix(attitude), y, weights, 5, tolerance = 0.005)
