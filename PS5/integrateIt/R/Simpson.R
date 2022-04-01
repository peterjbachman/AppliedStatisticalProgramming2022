#' Simpson S4 Class
#'
#' @slot x vector of values
#' @slot y vector of resulting values
#' @slot a Start value of integration
#' @slot b End value of integration
#' @slot n number of intervals
#' @slot est estimate of integral given the above information
#' @rdname Simpson
#' @export
setClass(
  Class = "Simpson",
  representation = representation(
    fun = "function",
    x = "numeric",
    y = "numeric",
    a = "numeric",
    b = "numeric",
    n = "numeric",
    est = "numeric"
  ),
  prototype = prototype(
    fun = function(x){return(x)},
    x = NA_real_,
    y = NA_real_,
    a = NA_real_,
    b = NA_real_,
    n = NA_real_,
    est = NA_real_
  )
)

setValidity("Simpson", function(object){
  # x and y are the same length
  test1 <- length(object@x) == length(object@y)
  # n is the right interval
  test2 <- length(object@x[object@x >= object@a & object@x <= object@b]) == (object@n + 1)
  # a and b are in the vector x
  test3 <- object@a %in% object@x & object@b %in% object@x
  if(!test1){stop("@x and @y are not the same length")}
  if(!test2){stop("@n is not the correct interval")}
  if(!test3){stop("@a or @b are not contained in @x")}
}
)

#' @export
setMethod(
  "initialize", "Simpson",
  function(.Object, ...) {
    value <- callNextMethod()
    validObject(value)
    return(value)
  }
)
