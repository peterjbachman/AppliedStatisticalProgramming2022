#' Trapezoid S4 Class
#'
#' @slot x vector of values
#' @slot y vector of resulting values
#' @slot a Start value of integration
#' @slot b End value of integration
#' @slot n number of intervals
#' @slot est estimate of integral given the above information
#' @rdname Trapezoid
#' @export
setClass(
  Class = "Trapezoid",
  representation = representation(
    x = "numeric",
    y = "numeric",
    a = "numeric",
    b = "numeric",
    n = "numeric",
    est = "numeric"
  ),
  prototype = prototype(
    x = NA_real_,
    y = NA_real_,
    a = NA_real_,
    b = NA_real_,
    n = NA_real_,
    est = NA_real_
  )
)

#' @export
setMethod(
  "initialize", "Trapezoid",
  function(.Object, ...) {
    value <- callNextMethod()
    return(value)
  }
)
