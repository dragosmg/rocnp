test_that("validate_cnp() works", {
  expect_equal(2 * 2, 4)
})

test_that("validate_nchar() works", {
  cnp <- c(1940616346114, 7041218318525)

  expect_no_error(
    validate_nchar(
      cnp
    )
  )

  expect_identical(
    validate_nchar(
      cnp
    ),
    cnp
  )
})

test_that("validate_nchar() errors when CNP is not exactly 13 characters", {
  expect_snapshot(
    error = TRUE,
    validate_nchar(
      49804232603223
    )
  )
})

test_that("validate_sex() works", {
  expect_equal(2 * 2, 4)
})

test_that("validate_month() works", {
  expect_equal(2 * 2, 4)
})

test_that("validate_day() works", {
  expect_equal(2 * 2, 4)
})
