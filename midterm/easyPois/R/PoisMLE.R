#' Poisson S4 Class
#'
#' @slot y vector of values
#' @slot MLE maximum likelihood estimator
#' @slot LL Log Likelihood from \code{y}
#' @slot SE Standard Error
#' @slot SEType Method of calculating Standard Error
#' @rdname PoisMLE
#' @export

setClass(
  Class = "PoisMLE",
  representation = representation(
    y = "numeric",
    MLE = "numeric",
    LL = "numeric",
    SE = "numeric",
    SEType = "character"
  ),
  prototype = prototype(
    y = NA_real_,
    MLE = NA_real_,
    LL = NA_real_,
    SE = NA_real_,
    SEType = NA_character_
  )
)

setValidity("PoisMLE", function(object) {
})

#' @export
setMethod(
  "initialize", "PoisMLE",
  function(.Object, ...) {
    value <- callNextMethod()
    validObject(value)
    return(value)
  }
)