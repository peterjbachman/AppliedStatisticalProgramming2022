test_that("Error messages work", {
  expect_error(
    standardError(c(1, -5, 6, 8)),
    "y should be non-negative values"
  )
  expect_error(
    standardError(c(1, 5, 6, 8), B = -1),
    "B cannot be a non-positive number"
  )
})

test_that("Correct calculations", {
  set.seed(12345)
  expect_equal(
    standardError(c(1, 5, 6, 8)),
    1.118034
  )

  # Since the bootstrapping is random, we need to decrease the tolerance on the
  # expect_equal values
  expect_equal(standardError(c(1, 5, 6, 8), "bootstrap"),
    0.6749486,
    tolerance = 0.001
  )
  expect_equal(standardError(c(1, 5, 6, 8), "bootstrap", 20),
    1.000904,
    tolerance = 0.001
  )
})
