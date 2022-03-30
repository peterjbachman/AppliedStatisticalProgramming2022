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
    if (rule == "Trapezoid") {
      .n <- length(x)
      .h <- (b - a) / .n
      .class <- new("Trapezoid", x = x, y = y, a = a, b = b)
      .est <- sum((.h / 2) * (rep_len(1:2, .n) * y))
    }

    return(list(.class, .est, c(x, y)))
  }
)
