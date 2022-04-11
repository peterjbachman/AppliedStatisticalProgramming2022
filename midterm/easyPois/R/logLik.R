logLik <- function(y, lambda) {
  LL <- (-length(y) * lambda) - sum(log(factorial(y))) + (log(lambda) * sum(y))
  return(LL)
}
