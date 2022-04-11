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
#' @seealso \link{\code{PoisMLE}}
#' @rdname estimatePois
#' @export
estimatePois <- function(y, SEType = "basic", samples = 10) {
  lambda <- mle(y)

    SE <- standardError(y, SEType, samples)

  PoisClass <- methods::new("PoisMLE", y = y, MLE = lambda, LL = logLik(y, lambda), SE = SE, SEType = SEType)
  return(PoisClass)
}
