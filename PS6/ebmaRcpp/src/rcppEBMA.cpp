#include <Rcpp.h>
#include "functions.hpp"
using namespace Rcpp;

//' Perform EBMA using C++
//'
//' @param x Numeric Matrix of X values for the models
//' @param y Actual values for each observation in a vector
//' @param weights Vector of weights for each of the models
//' @param sd Standard Deviation
//' @param tolerance The level of change between iterations where the model will
//' stop.
//'
//' @export
// [[Rcpp::export]]
NumericVector rCppEBMA(NumericMatrix x, NumericVector y, NumericVector weights, double sd, double tolerance){

  bool threshold = FALSE;
  int iterations = 0;

  while (threshold == FALSE){
    NumericMatrix zHats = zHat(x, y, weights, sd);
    NumericVector weightsNew = wHat(zHats);

    LogicalVector test = ((weights - weightsNew) < tolerance);

    if (is_true ( all(test) )) {
      threshold = TRUE;
    } else {
      weights = weightsNew;
    }

    iterations = iterations + 1;
  }

  Rcout << "The number of iterations to reach a tolerance of : " << tolerance << " is " << iterations << "\n";
  return weights;
}
