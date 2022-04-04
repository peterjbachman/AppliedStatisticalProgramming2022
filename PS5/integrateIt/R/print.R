#' Print the Estimation class
#'
#' Prints the estimation of either Simpson's or Trapezoidal Rule
#'
#' @param object object that is either "Trapezoid" or "Simpson"
#'
#' @examples
#' funct <- function(x) {return(sin(x))}
#' result <- integrateIt(funct, 1, 5, 10, "Trapezoid")
#' print(result$EstType)
#'
#' @export
setGeneric(
  name = "print",
  def = function(object) {
    standardGeneric("print")
  }
)

setMethod(
  "print", "Trapezoid",
  function(object) {
    return(object@est)
  }
)

setMethod(
  "print", "Simpson",
  function(object) {
    return(object@est)
  }
)
