test_that("new_cnp() works", {
  expect_no_error(
    new_cnp(c("1940616346114", "7041218318525"))
  )

  expect_s3_class(
    new_cnp(c("1940616346114", "7041218318525")),
    "cnp"
  )

  expect_s3_class(
    new_cnp(c("1940616346114", "7041218318525")),
    "vctrs_vctr"
  )
})

test_that("new_cnp() complains when input is not character", {
  expect_snapshot(
    error = TRUE,
    new_cnp(1:2)
  )
})

test_that("cnp() works", {
  expect_no_error(
    cnp(c("1940616346114", "7041218318525"))
  )

  expect_s3_class(
    cnp(c("1940616346114", "7041218318525")),
    "cnp"
  )

  expect_s3_class(
    cnp(c("1940616346114", "7041218318525")),
    "vctrs_vctr"
  )
})

test_that("cnp() complains when the input does not have exactly 13 chars", {

  expect_snapshot(
    error = TRUE,
    cnp(c("1940616346114", "70412183185253"))
  )

})
