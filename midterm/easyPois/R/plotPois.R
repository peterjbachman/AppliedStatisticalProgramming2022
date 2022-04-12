#' Plot the MLE
#'
#' Plots the MLE with confidence intervals for \code{PoisMLE} class objects
#'
#' @param object A \code{PoisMLE} class object
#' @return Plot of MLE with 95\% confidence intervals
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
#' plotPois(est)
#' plotPois(estBoot)
#'
#' @name plotPois
#' @aliases plotPois,PoisMLE-method
#' @docType methods
#' @rdname plotPois-methods
#'
#' @export
setGeneric("plotPois", function(object) standardGeneric("plotPois"))

#' @export
setMethod("plotPois", "PoisMLE", function(object) {

  # create objects for plotting confidence interval
  x <- 0
  y <- object@MLE
  se <- object@SE
  upper <- object@MLE + se * 1.96
  lower <- object@MLE - se * 1.96

  plot(x,
    y,
    ylim = c(y - 4 * se, y + 4 * se),
    col = "black",
    bg = "black",
    pch = 21,
    ylab = "Maximum Likelihood Estimate",
    main = "MLE and 95% confidence intervals"
  )
  # graph horizontal line
  graphics::arrows(
    x0 = 0,
    x1 = 0,
    y0 = upper,
    y1 = lower,
    length = 0
  )
  # upper bound
  graphics::arrows(
    x0 = -0.25,
    x1 = 0.25,
    y0 = upper,
    y1 = upper,
    length = 0
  )
  # lower bound
  graphics::arrows(
    x0 = -0.25,
    x1 = 0.25,
    y0 = lower,
    y1 = lower,
    length = 0
  )
})
