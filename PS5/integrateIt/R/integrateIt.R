#' Integrate via Trapezoid or Simpson's rule
#'
#' Calculates the integral estimation using either the Trapezoid rule or Simpson's rule
#'
#' @param x A numeric object
#' @param y A numeric object with the same dimensionality as \code{x}.
#'
#' @return An object of class AllSquares containing
#'  \item{addSquares}{The sum of the squared values}
#'  \item{subtractSquares}{The difference of the squared values}
#'  \item{x}{The first object input}
#'  \item{y}{The second object input}
#' @author Peter Bachman
#' @note This produces an object of a new class
#' @examples
#'
#' myX <- c(20, 3)
#' myY <- c(-2, 4.1)
#' allSquares(myX, myY)
#' @seealso \code{\link{Trapezoid}}
#' @rdname integrateIt
#' @aliases IntegrateIt
#' @export
setGeneric(
  name = "integrateIt",
  def = function(x, y, a, b, rule) {
    standardGeneric("integrateIt")
  }
)

setMethod("integrateIt",
  definition = function(x, y, a, b, rule) {
    # find interval for values of x
    .intervalX <- x[x >= a & x <= b]
    .intervalY <- y[x >= a & x <= b]
    .n <- length(.intervalX) - 1
    .h <- (b - a) / .n

    # not sure why we don't separate the generic in the setMethod but oh well
    if (rule == "Trapezoid") {
      .est <- (.h / 2) * (.intervalY[1] + sum(2 * .intervalY[2:(.n)]) + .intervalY[.n + 1])
      .class <- new("Trapezoid", x = .intervalX, y = .intervalY, a = a, b = b, n = .n, est = .est)
    } else if (rule == "Simpson") {
      .est <- (.h / 3) * (.intervalY[1] + sum((rep_len(c(4,2), .n - 1) * .intervalY[2:(.n)])) + .intervalY[.n + 1])
      .class <- new("Simpson", x = .intervalX, y = .intervalY, a = a, b = b, n = .n, est = .est)
    } else {
      stop("Defined rule is not allowed. Use either Trapezoid or Simpson")
    }

    return(list(.class, .est, matrix(c(x,y), ncol = 2), .h))
  }
)
