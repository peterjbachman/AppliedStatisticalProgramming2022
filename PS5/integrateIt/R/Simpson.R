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
    a = "numeric",
    b = "numeric",
    n = "numeric",
    est = "numeric"
  ),
  prototype = prototype(
    fun = function(x){return(x)},
    a = NA_real_,
    b = NA_real_,
    n = NA_real_,
    est = NA_real_
  )
)

setValidity("Simpson", function(object){
  # x and y are the same length
  test1 <- TRUE
  # n is the right interval
  test2 <- TRUE
  # a and b are in the vector x
  test3 <- TRUE
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
