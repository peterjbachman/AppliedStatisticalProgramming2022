#' Log Likelihood estimator
#'
#' Calculates the Log Likelihood from observed data and a value for lambda
#'
#' @param y A vector with the observed data
#' @param lambda A value for the expected lambda
#' @return The Log Likelihood Estimate
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#' @seealso \code{\link{mle}}
#' @rdname logLik
#' @export
logLik <- function(y, lambda) {
  LL <- (-length(y) * lambda) - sum(log(factorial(y))) + (log(lambda) * sum(y))
  return(LL)
}
