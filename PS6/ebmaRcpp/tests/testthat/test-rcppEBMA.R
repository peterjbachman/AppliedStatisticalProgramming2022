test_that("full function works", {
  y <- rep_len(50, 30)
  weights <- rep_len(1 / 7, 7)
  expect_equal(
    rcppEBMA(as.matrix(attitude), y, weights, 5, tolerance = 0.00005),
    c(
      3.349082e-02, 8.127623e-11, 3.768975e-01, 2.734239e-01, 3.751721e-02,
      2.835489e-30, 2.786706e-01
    ),
    tolerance = 0.0001
  )
})
