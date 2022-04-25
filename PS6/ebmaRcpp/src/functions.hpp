#include <Rcpp.h>
using namespace Rcpp;
NumericMatrix zHat(NumericMatrix x, NumericVector y, NumericVector weights, double sd);
NumericVector wHat(NumericMatrix zHats);
