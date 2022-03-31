#' Integrate via Trapezoid or Simpson's rule
#'
#' Calculates the integral estimation using either the Trapezoid rule or Simpson's rule
#'
#' @param x Vector of X values, numeric
#' @param y Vector of Y values in relation to \code{x}, numeric
#' @param a Starting value found in \code{x}
#' @param b Ending value found in \code{x}, numeric object
#' @param rule Stating estimation rule to use. Either \code{"Trapezoid"} or \code{"Simpson"}
#'
#' @return A list containing:
#'  \item{EstType}{Estimation Class}
#'  \item{Estimation}{Result of the estimation}
#'  \item{Values}{Matrix of X and Y given in function}
#' @author Peter Bachman
#' @note The interval in this is calculated automatically as being 1 - the distance between a and b in the vector \code{x}
#' @examples
#'
#' X <- 1:5
#' y <- sin(X)
#' integrateIt(X, Y, 1, 5, "Trapezoid")
#' integrateIt(X, Y, 2, 4, "Simpson")
#' @seealso \code{\link{Trapezoid}}, \code{\link{Simpson}}
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
    if (tolower(rule) == "trapezoid") {
      # calculate the estimate
      .est <- (.h / 2) * (.intervalY[1] + sum(2 * .intervalY[2:(.n)]) + .intervalY[.n + 1])
      .class <- new("Trapezoid", x = x, y = y, a = a, b = b, n = .n, est = .est)
    } else if (tolower(rule) == "simpson") {
      # calculate the estimate
      # rep_len(c(4,2), .n - 1) flips between 4 and 2
      .est <- (.h / 3) * (.intervalY[1] + sum((rep_len(c(4,2), .n - 1) * .intervalY[2:(.n)])) + .intervalY[.n + 1])
      .class <- new("Simpson", x = x, y = y, a = a, b = b, n = .n, est = .est)
    } else {
      stop("Defined rule is not allowed. Use either Trapezoid or Simpson")
    }
    # Return the list of values requested
    return(list(EstType = .class, Estimation = .est, Values = matrix(c(.class@x,.class@y), ncol = 2)))
  }
)
