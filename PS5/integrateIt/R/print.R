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
