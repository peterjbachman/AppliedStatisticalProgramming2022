test_that("Log likelihood is calculated correctly", {
  set.seed(12345)
  y <- rpois(n = 10000, lambda = 5)

  # without the tolerance argument this fails
  expect_equal(logLik(y, 5),
    -21967.24,
    tolerance = 0.0001
  )
})

test_that("error messages are correct", {
  expect_error(
    logLik(c(-1, 2, 4, 6), 1),
    "y should be non-negative values"
  )
  expect_error(
    logLik(c(-1, 2, 4, 6), -1),
    "lambda should be non-negative"
  )
})
