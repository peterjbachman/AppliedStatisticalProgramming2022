test_that("multiplication works", {
  expect_equal(
    wHat(
      matrix(
        c(
          3.775111e-11, 9.999939e-01, 2.281646e-87, 8.756457e-27,
          8.756457e-27, 0.000000e+00, 6.144175e-06, 3.244481e-37,
          4.448051e-43, 9.814807e-01, 5.428416e-04, 3.244481e-37,
          2.178405e-115, 1.797645e-02, 1.278367e-95, 1.022569e-86,
          3.257489e-70, 3.009089e-78, 1.194137e-146, 2.791031e-281,
          1.000000e+00
        ),
        nrow = 3, ncol = 7, byrow = TRUE
      )
    ),
    c(
      1.258370e-11, 3.333313e-01, 3.271602e-01, 1.809472e-04, 2.918819e-27,
      7.261350e-116, 3.393275e-01
    ),
    tolerance = 0.00001
  )
})
