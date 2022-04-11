#' Standard Error for Poisson Distribution
#'
#' Calculates the Standard Error for a Poisson Distribution
#'
#' @param y A vector with the observed data
#' @param SEType Calculate the standard error using either \code{basic} or \code{bootstrap}. Defaults to \code{basic}.
#' @param B Number of samples. Default is 10 samples
#' @return The Standard Error for the observed data.
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#' @rdname standardError
#' @export
standardError <- function(y, SEType = "basic", B = 10) {
  if (SEType == "basic") {
    SE <- sqrt(mle(y) / length(y))
  } else if (SEType == "bootstrap") {
    # columns for `samples` are the individual samples which should then be
    # length(y) rows long.
    samples <- replicate(B, sample(y, length(y), TRUE))
    # calculate the MLE per column
    MLE <- apply(samples, 2, mle)
    SE <- stats::sd(MLE)
  }

  return(SE)
}
