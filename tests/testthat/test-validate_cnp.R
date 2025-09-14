test_that("validate_cnp() works", {
  expect_no_error(
    validate_cnp(
      new_cnp(
        c(
          "1940616346114",
          "7041218318525"
        )
      )
    )
  )
})

test_that("validate_nchar() works", {
  cnp <- new_cnp(c("1940616346114", "7041218318525"))

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
  # too long
  expect_snapshot(
    error = TRUE,
    validate_nchar(
      new_cnp(
        "49804232603223"
      )
    )
  )

  # too short
  expect_snapshot(
    error = TRUE,
    validate_nchar(
      new_cnp(
        "620120601807"
      )
    )
  )
})

test_that("validate_sex() works", {
  cnp <- new_cnp(c("1940616346114", "7041218318525"))

  expect_no_error(
    validate_sex(
      cnp
    )
  )

  expect_identical(
    validate_sex(
      cnp
    ),
    cnp
  )
})

test_that("validate_sex() errors when the first digit is 0 or 9", {

  expect_snapshot(
    error = TRUE,
    validate_sex(
      new_cnp("0940616346114")
    )
  )

  expect_snapshot(
    error = TRUE,
    validate_sex(
      new_cnp("9041218318525")
    )
  )
})

test_that("validate_month() works", {
  cnp <- new_cnp(c("1940616346114", "7041218318525"))

  expect_no_error(
    validate_month(
      cnp
    )
  )

  expect_identical(
    validate_month(
      cnp
    ),
    cnp
  )
})

test_that("validate_month() errors", {

  expect_snapshot(
    error = TRUE,
    validate_month(
      new_cnp(
        "1941316346114"
      )
    )
  )

  expect_snapshot(
    error = TRUE,
    validate_month(
      new_cnp(
        "7042218318525"
      )
    )
  )
})

test_that("validate_day() works", {
  cnp <- new_cnp(c("1940616346114", "7041218318525"))

  expect_no_error(
    validate_day(
      cnp
    )
  )

  expect_identical(
    validate_day(
      cnp
    ),
    cnp
  )
})

test_that("validate_day() complains correctly", {

  # June (06) does not have 31 days
  expect_snapshot(
    error = TRUE,
    validate_day(
      new_cnp(
        "1940631346114"
      )
    )
  )

  # December (12) does not have 32 days
  expect_snapshot(
    error = TRUE,
    validate_day(
      new_cnp(
        "7041232318525"
      )
    )
  )

  # February in non-leap years does not have more than 28 days
  expect_snapshot(
    error = TRUE,
    validate_day(
      new_cnp(
        "197022946114"
      )
    )
  )

  # February in leap years does not have more than 29 days
  expect_snapshot(
    error = TRUE,
    validate_day(
      new_cnp(
        "7040230318525"
      )
    )
  )
})

test_that("validate_checksum() works", {
  cnp <- new_cnp(c("1940616346114", "7041218318525"))

  expect_no_error(
    validate_checksum(
      cnp
    )
  )

  expect_identical(
    validate_day(
      cnp
    ),
    cnp
  )
})

test_that("validate_checksum() identifies invalid CNPs", {
  # modified the last digit
  cnp <- new_cnp(c("1940616346113", "7041218318522"))

  expect_snapshot(
    error = TRUE,
    validate_checksum(
      cnp
    )
  )
})

test_that("calculate_cheksum() works", {
  cnp_string <- c("1940616346114", "7041218318525")

  cnp_digits <- list(
    c(1L, 9L, 4L, 0L, 6L, 1L, 6L, 3L, 4L, 6L, 1L, 1L),
    c(7L, 0L, 4L, 1L, 2L, 1L, 8L, 3L, 1L, 8L, 5L, 2L),
    NA
  )

  expect_identical(
    purrr::map_int(
      cnp_digits,
      calculate_checksum
    ),
    # the last 2 digits of the original CNPs
    c(4L, 5L, NA)
  )
})

test_that("calculate_checksum() complains", {
  # too many digits
  expect_snapshot(
    error = TRUE,
    calculate_checksum(
      new_cnp(
        c(
          "19406163461132",
          "70412183185223"
        )
      )
    )
  )
})
