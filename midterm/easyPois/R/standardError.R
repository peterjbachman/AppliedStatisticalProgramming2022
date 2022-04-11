#' Standard Error for Poisson Distribution
#'
#' Calculates the Standard Error for a Poisson Distribution
#'
#' @param y A vector with the observed data
#' @param SEType Calculate the standard error using either \code{basic} or \code{bootstrap}. Defaults to \code{basic}.
#' @param B Number of samples. Default is 10 samples
#' @return The Standard Error for the observed data.
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#'
#' @examples
#' set.seed(12345)
#' y <- rpois(1000, 5)
#'
#' standardError(y, "basic")
#' standardError(y, "bootstrap", 20)
#'
#' @rdname standardError
#' @export
standardError <- function(y, SEType = "basic", B = 10) {
  if (any(y < 0)) {stop("y should be non-negative values")}
  if (B <= 0) {stop("B cannot be a non-positive number")}

  if (SEType == "basic") {
    SE <- sqrt(mle(y) / length(y))
  } else if (SEType == "bootstrap") {
    # columns for `samples` are the individual samples which should then be
    # length(y) rows long.
    samples <- replicate(B, sample(y, length(y), TRUE))
    # calculate the MLE per column
    MLE <- apply(samples, 2, mle)
    SE <- stats::sd(MLE)
  } else {
    stop("SEType should be either \"basic\" or \"bootstrap\".")
  }

  return(SE)
}
