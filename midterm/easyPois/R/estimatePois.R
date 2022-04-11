#' Estimate for a Poisson Distribution
#'
#' Calculates the estimates for a Poisson Distribution
#'
#' @param y A vector with observed data
#' @param SEType Defines how the Standard Errors will be calculated. Can pick
#'        from \code{basic} or \code{bootstrap}. Defaults to \code{bootstrap}.
#' @param samples If \code{SEType = "bootstrap"} then this defines the number of
#'        samples that will be used.
#' @return an S4 class of \code{PoisMLE}
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#' @seealso [PoisMLE-class]
#'
#' @examples
#' set.seed(12345)
#' y <- rpois(1000, 5)
#'
#' est <- estimatePois(y, SEType = "basic")
#' estBoot <- estimatePois(y, SEType = "bootstrap", samples = 20)
#'
#' @rdname estimatePois
#' @export
estimatePois <- function(y, SEType = "basic", samples = 10) {
  # Check if samples is a positive number
  if (samples <= 0) {
    stop("Samples cannot be a non-positive number")
  }

  lambda <- mle(y)

  SE <- standardError(y, SEType, samples)

  # input everything into PoisMLE Class
  PoisClass <- methods::new("PoisMLE", y = y, MLE = lambda, LL = logLik(y, lambda), SE = SE, SEType = SEType)
  return(PoisClass)
}
