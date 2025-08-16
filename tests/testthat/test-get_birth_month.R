test_that("get_birth_month works", {

  valid_cnps <- cnp(c(1940616346114, 7041218318525, 4980423260322, NA))
  month_vec_num <- c("06", "12", "04", NA)

  expect_identical(
    get_birth_month(valid_cnps),
    month_vec_num
  )

  expect_identical(
    get_birth_month(
      cnp(1940616346114)
    ),
    "06"
  )
})
