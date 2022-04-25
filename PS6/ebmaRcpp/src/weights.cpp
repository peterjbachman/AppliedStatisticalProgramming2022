#include <Rcpp.h>
using namespace Rcpp;

//' Compute the adjusted weights
//' @export
// [[Rcpp::export]]
NumericVector wHat(NumericMatrix z) {
  int rows = z.nrow();
  int cols = z.ncol();
  NumericVector wOut(cols);

  for (int j = 0; j < cols; ++j) {

    double newWeight = 0;
    for (int i = 0; i < rows; ++i) {
      newWeight +=  z(i,j);
    }
    wOut[j] = newWeight / rows;
  }
  return wOut;
}

