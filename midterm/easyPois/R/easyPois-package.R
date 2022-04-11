#' easyPois
#'
#' The easyPois package is used to estimate the value of lambda from a vector of
#' data. You can create an S4 Class with the necessary information for a Poisson
#' Distribution.
#'
#' @name easyPois
#' @docType package
#' @author  Peter Bachman: \email{bachman.p@wustl.edu}
#'
#' @examples
#' set.seed(12345)
#' y <- rpois(1000, 5)
#'
#' est <- estimatePois(y, SEType = "basic")
#' estBoot <- estimatePois(y, SEType = "bootstrap", samples = 20)
#'
"_PACKAGE"
