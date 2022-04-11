test_that("expected class", {
  set.seed(12345)
  y <- rpois(n = 10000, lambda = 5)

  expect_s4_class(
    estimatePois(y, "basic"),
    "PoisMLE"
  )
  expect_s4_class(
    estimatePois(y, "bootstrap"),
    "PoisMLE"
  )
})

test_that("expected error", {
  set.seed(12345)
  y <- rpois(n = 10000, lambda = 5)

  expect_error(
    estimatePois(y, "bootstrap", -10),
    "Samples cannot be a non-positive number"
  )
  expect_error(
    estimatePois(y, samples = -10),
    "Samples cannot be a non-positive number"
  )
})

test_that("expected values", {
  set.seed(12345)
  y <- rpois(n = 10000, lambda = 5)

  expect_equal(
    estimatePois(y, "basic"),
    new("PoisMLE",
      y = y,
      MLE = mle(y),
      LL = logLik(y, mle(y)),
      SE = standardError(y),
      SEType = "basic"
    )
  )

  # Since the bootstrapping is random, we need to decrease the tolerance on the
  # expect_equal values
  expect_equal(estimatePois(y, "bootstrap", 20),
    new("PoisMLE",
      y = y,
      MLE = mle(y),
      LL = logLik(y, mle(y)),
      SE = 0.02135919,
      SEType = "bootstrap"
    ),
    tolerance = 0.001
  )
  expect_equal(estimatePois(y, "bootstrap"),
    new("PoisMLE",
      y = y,
      MLE = mle(y),
      LL = logLik(y, mle(y)),
      SE = 0.02179874,
      SEType = "bootstrap"
    ),
    tolerance = 0.001
  )
})
