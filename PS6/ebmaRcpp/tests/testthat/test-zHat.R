test_that("Calculations are done correctly", {
  expect_error(
    zHat(c(1, 2, 3, 4, 5), 4, 1, 2),
    "Not a matrix."
  )
  expect_equal(
    zHat(as.matrix(attitude[1:3, ]), rep.int(50, 30), rep_len(1 / 7, 7), 1),
    matrix(c(
      3.775111e-11, 9.999939e-01, 2.281646e-87, 8.756457e-27,
      8.756457e-27, 0.000000e+00, 6.144175e-06, 3.244481e-37,
      4.448051e-43, 9.814807e-01, 5.428416e-04, 3.244481e-37,
      2.178405e-115, 1.797645e-02, 1.278367e-95, 1.022569e-86,
      3.257489e-70, 3.009089e-78, 1.194137e-146, 2.791031e-281,
      1.000000e+00
    ),
    nrow = 3, ncol = 7, byrow = TRUE
    ),
    tolerance = 0.0001
  )
})
