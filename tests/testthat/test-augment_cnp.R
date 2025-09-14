test_that("parse_sex() works", {
  cnp <- list(
    s = as.character(1L:8L)
  )

  expect_named(
    parse_sex(cnp),
    c("s", "sex")
  )

  expect_identical(
    parse_sex(cnp)[["sex"]],
    c("M", "F", "M", "F", "M", "F", "M", "F")
  )
})

test_that("parse_yob() works", {
  valid_cnp <- c("1940616346114", "7041218318525", "4980423260322", NA)

  expect_snapshot(
    parse_yob(decompose_cnp(valid_cnp))
  )

  expect_identical(
    parse_yob(decompose_cnp(valid_cnp))[["yob"]],
    c("1994", "2004", "1898", NA)
  )
})

test_that("parse_dob() works", {
  valid_cnp <- c("1940616346114", "7041218318525", "4980423260322", NA)

  valid_cnp |>
    decompose_cnp() |>
    parse_yob() |>
    parse_dob() |>
    expect_snapshot()

  cnp <-  valid_cnp |>
    decompose_cnp() |>
    parse_yob() |>
    parse_dob()

  expect_identical(
    cnp[["dob"]],
    as.Date(c("1994-06-16", "2004-12-18", "1898-04-23", NA))
  )
})

test_that("parse_county() works", {
  valid_cnp <- c("1940616346114", "7041218318525", "4980423260322", NA)

  valid_cnp |>
    decompose_cnp() |>
    parse_county() |>
    expect_snapshot()

  cnp <- valid_cnp |>
    decompose_cnp() |>
    parse_county()

  expect_identical(
    cnp[["county"]],
    c("Teleorman", "Sălaj", "Mureș", NA)
  )
})

test_that("parse_status() works", {
  valid_cnp <- c("1940616346114", "7041218318525", "4980423260322", NA)

  valid_cnp |>
    decompose_cnp() |>
    parse_status() |>
    expect_snapshot()

  cnp <- valid_cnp |>
    decompose_cnp() |>
    parse_status()

  expect_identical(
    cnp[["status"]],
    c("native", "resident", "native", NA)
  )
})

test_that("augment_cnp() works", {
  valid_cnp <- c("1940616346114", "7041218318525", "4980423260322", NA)

  valid_cnp |>
    decompose_cnp() |>
    augment_cnp() |>
    expect_snapshot()

  cnp <- valid_cnp |>
    decompose_cnp() |>
    augment_cnp()

  expect_named(
    cnp,
    c(
      "s", "aa", "ll", "zz", "jj", "nnn", "c", "cnp", "sex", "yob", "dob",
      "county", "status"
    )
  )
})
