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
  test2 <- object@MLE == mle(object@y)
  test3 <- object@LL == logLik(object@y, object@MLE)
  test4 <- if (object@SEType == "basic") {
    object@SE == standardError(object@y, "basic")
  } else {
    TRUE
  }
  test5 <- any(object@y < 0)
  test6 <- object@MLE < 0 | object@SE < 0
  if (!test1) {
    stop("@SEType needs to be either \'basic\' or \'bootstrap\'")
  }
  if (!test2) {
    stop("MLE not correct")
  }
  if (!test3) {
    stop("Log Likelihood is not correct")
  }
  if (!test4) {
    stop("SEType is \"basic\" and is not correct.")
  }
  if (test5) {
    stop("y should be non-negative values")
  }
  if (test6) {
    stop("MLE or SE cannot be negative")
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
