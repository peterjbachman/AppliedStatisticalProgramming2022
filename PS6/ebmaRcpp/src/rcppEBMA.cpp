#include <Rcpp.h>
#include "functions.hpp"
using namespace Rcpp;

//' @export
// [[Rcpp::export]]
NumericMatrix rCppEBMA(NumericMatrix xMatrix, NumericVector yVector, NumericVector weights, double sd, int iterations){
  NumericMatrix w((iterations + 1), xMatrix.ncol());
  w( 0 , _ ) = weights;

  for (int i = 0; i < iterations; ++i){
    Rcout << "The value of xMatrix : " << xMatrix << "\n";
    NumericVector wHats = w(i, _ );
    NumericMatrix zHats = zHat(xMatrix, yVector, wHats, sd);
    w((i + 1), _ ) = wHat(zHats);
  }

  return w;
}
