#' Trapezoid S4 Class
#'
#' @slot func Function to integrate
#' @slot a Start value of integration
#' @slot b End value of integration
#' @slot n Number of intervals the user wishes to use
#' @export

setClass(Class="Trapezoid",
         representation = representation(
           func = "function",
           a = "numeric",
           b = "numeric",
           n = "numeric"
         ),
         prototype = prototype(
           func = function(x) {return(x)},
           a = NA_real_,
           b = NA_real_,
           n = NA_real_
         )
)

test <- new("Trapezoid")
