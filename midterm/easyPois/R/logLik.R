#' Log Likelihood estimator
#'
#' Calculates the Log Likelihood from observed data and a value for lambda
#'
#' @param y A vector with the observed data
#' @param lambda A value for the expected lambda
#' @return The Log Likelihood Estimate
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#' @seealso [mle()]
#'
#' @examples
#' set.seed(12345)
#' y <- rpois(1000, 5)
#' l <- mle(y)
#'
#' logLik(y, l)
#'
#' @rdname logLik
#' @export
logLik <- function(y, lambda) {
  # tests to make sure non-negative values aren't input
  if (lambda < 0) {
    stop("lambda should be non-negative")
  }
  if (any(y < 0)) {
    stop("y should be non-negative values")
  }

  LL <- (-length(y) * lambda) - sum(log(factorial(y))) + (log(lambda) * sum(y))
  return(LL)
}
