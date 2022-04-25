#include <Rcpp.h>
using namespace Rcpp;

//' Compute the predicted z-values
//'
//' @param x Numeric Matrix of X values for the models
//' @param y Actual values for each observation in a vector
//' @param weights Vector of weights for each of the models
//' @param sd Standard Deviation
//'
//' @export
// [[Rcpp::export]]
NumericMatrix zHat(NumericMatrix x, NumericVector y, NumericVector weights, double sd){
  int rows = x.nrow();
  NumericMatrix dNormal(x.nrow(), x.ncol());
  NumericMatrix out(x.nrow(), x.ncol());

  for (int i = 0; i < x.nrow(); ++i) {
    for (int j = 0; j < x.ncol(); ++j) {
      double datNumber = R::dnorm(y[i], x(i,j), sd, FALSE);
      dNormal(i,j) =  datNumber; //
    }
  }

  NumericVector sums(rows);
  for (int i = 0; i < rows; ++i) {

    double rowSum = 0;
    for (int j = 0; j < dNormal.ncol(); ++j) {
      rowSum += weights[j] * dNormal(i,j);
    }
    sums[i] = rowSum;
  }

  for (int i = 0; i < x.nrow(); ++i) {
    for (int j = 0; j < x.ncol(); ++j) {
      out(i,j) =  weights[j] * dNormal(i,j) / sums[i]; //
    }
  }

  return out;
}


