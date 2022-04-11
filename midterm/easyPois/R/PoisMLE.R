#' Poisson S4 Class
#'
#' A class for a Poisson distribution with the following slots:
#'
#' @slot y vector of values
#' @slot MLE maximum likelihood estimator
#' @slot LL Log Likelihood from \code{y}
#' @slot SE Standard Error
#' @slot SEType Method of calculating Standard Error, either `basic` or `bootstrap`
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
  test1 <- object@SEType == "basic" | object@SEType == "bootstrap"
  if (!test1) {
    stop("@SEType needs to be either \'basic\' or \'bootstrap\'")
  }
})

setMethod(
  "initialize", "PoisMLE",
  function(.Object, ...) {
    value <- methods::callNextMethod()
    methods::validObject(value)
    return(value)
  }
)
