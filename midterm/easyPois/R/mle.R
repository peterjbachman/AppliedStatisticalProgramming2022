#' Maximum Likelihood Estimator
#'
#' Calculates the MLE for a Poisson Distribution
#'
#' @param y A vector with the observed data
#' @return The MLE Estimate for lambda
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#'
#' @examples
#' set.seed(12345)
#' y <- rpois(1000, 5)
#'
#' mle(y)
#'
#' @export
mle <- function(y) {
  # Produce error for empty vectors
  if (length(y) == 0) {
    stop("y should be a non-zero vector")
  }
  # error for y vector with negative values
  if (any(y < 0)) {
    stop("y should be non-negative values")
  }

  return(sum(y) / length(y))
}
