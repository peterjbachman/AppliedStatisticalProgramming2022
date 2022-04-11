test_that("any length vector will work", {
  expect_equal(mle(c(2)), 2)
  expect_equal(mle(c(1,2,3)), 2)
  expect_equal(mle(c(1,2,3,4,5)), 3)
})

test_that("empty vectors will produce an error", {
  expect_error(mle(c()), "y should be a non-zero vector")
})
