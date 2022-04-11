#' Maximum Likelihood Estimator
#'
#' Calculates the MLE for a Poisson Distribution
#'
#' @param y A vector with the observed data
#' @return The MLE Estimate for lambda
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#' @rdname mle
#' @export
mle <- function(y) {
  # Produce error for empty vectors
  if (length(y) == 0) {
    stop("y should be a non-zero vector")
  }

  return(sum(y) / length(y))
}
