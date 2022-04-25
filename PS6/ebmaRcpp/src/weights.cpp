#include <Rcpp.h>
using namespace Rcpp;

//' Compute the adjusted weights
//'
//' @param z matrix of the predicted z values
//'
//' @export
// [[Rcpp::export]]
NumericVector wHat(NumericMatrix z) {

  // Initialize variables
  int rows = z.nrow();
  int cols = z.ncol();
  NumericVector wOut(cols);

  // New weights are calculated by summing the zHats by column and then dividing
  // by the number of rows in the matrix
  for (int j = 0; j < cols; ++j) {

    double newWeight = 0;
    for (int i = 0; i < rows; ++i) {
      newWeight +=  z(i,j);
    }
    wOut[j] = newWeight / rows;
  }
  return wOut;
}

