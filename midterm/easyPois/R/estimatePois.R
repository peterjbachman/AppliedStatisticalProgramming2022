estimatePois <- function(y, SEType = "basic", samples = 10) {
  lambda <- mle(y)

    SE <- standardError(y, SEType, samples)

  PoisClass <- new("PoisMLE", y = y, MLE = lambda, LL = logLik(y, lambda), SE = SE, SEType = SEType)
  return(PoisClass)
}
