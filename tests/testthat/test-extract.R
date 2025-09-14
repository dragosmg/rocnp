test_that("extract_sex() works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  sex_vec <- c("M", "M", "F", NA_character_)

  expect_identical(
    extract_sex(
      new_cnp("1940616346114")
    ),
    "M"
  )

  expect_identical(
    extract_sex(
      new_cnp("7041218318525")
    ),
    "M"
  )

  expect_identical(
    extract_sex(
      new_cnp(
        "6201206018078"
      )
    ),
    "F"
  )

  expect_identical(
    extract_sex(
      new_cnp(
        "7321206018072"
      )
    ),
    "M"
  )

  expect_identical(
    extract_sex(
      new_cnp(
        "4980423260322"
      )
    ),
    "F"
  )

  expect_identical(
    extract_sex(
      new_cnp(
        valid_cnps
      )
    ),
    sex_vec
  )
})

test_that("extract_birth_year() works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  birth_year_vec <- c("1994", "2004", "1898", NA)

  expect_identical(
    extract_birth_year(
      new_cnp(
        valid_cnps
      )
    ),
    birth_year_vec
  )

  expect_identical(
    extract_birth_year(
      new_cnp(
        "1940616346114"
      )
    ),
    "1994"
  )

  expect_identical(
    extract_birth_year(
      new_cnp(
        "7041218318525"
      )
    ),
    "2004"
  )

  expect_identical(
    extract_birth_year(
      new_cnp(
        "6201206018078"
      )
    ),
    "2020"
  )

  expect_identical(
    extract_birth_year(
      new_cnp(
        "7321206018072"
      )
    ),
    "1932"
  )

  expect_identical(
    extract_birth_year(
      new_cnp(
        "4980423260322"
      )
    ),
    "1898"
  )
})

test_that("extract_birth_month() works", {

  valid_cnps <- cnp(c(1940616346114, 7041218318525, 4980423260322, NA))
  month_vec_num <- c("06", "12", "04", NA)

  expect_identical(
    extract_birth_month(valid_cnps),
    month_vec_num
  )

  expect_identical(
    extract_birth_month(
      cnp(1940616346114)
    ),
    "06"
  )
})

test_that("extract_dob() works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  dob_vec <- as.Date(c("1994-06-16", "2004-12-18", "1898-04-23", NA))

  expect_identical(
    extract_dob(
      new_cnp("1940616346114")
    ),
    as.Date("1994-06-16")
  )

  expect_identical(
    extract_dob(
      new_cnp("7041218318525")
    ),
    as.Date("2004-12-18")
  )

  expect_identical(
    extract_dob(
      new_cnp(
        "6201206018078"
      )
    ),
    as.Date("2020-12-06")
  )

  expect_identical(
    extract_dob(
      new_cnp(
        "7321206018072"
      )
    ),
    as.Date("1932-12-06")
  )

  expect_identical(
    extract_dob(
      new_cnp(
        "4980423260322"
      )
    ),
    as.Date("1898-04-23")
  )

  expect_identical(
    extract_dob(
      new_cnp(
        valid_cnps
      )
    ),
    dob_vec
  )
})

test_that("extract_county() works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  counties <- c("Teleorman", "Sălaj", "Mureș", NA_character_)

  expect_identical(
    extract_county(
      new_cnp(
        "1940616346114"
      )
    ),
    "Teleorman"
  )

  expect_identical(
    extract_county(
      new_cnp(
        "7041218318525"
      )
    ),
    "Sălaj"
  )

  expect_identical(
    extract_county(
      new_cnp(
        "6201206018078"
      )
    ),
    "Alba"
  )

  expect_identical(
    extract_county(
      new_cnp("7321206018072")
    ),
    "Alba"
  )

  expect_identical(
    extract_county(
      new_cnp(
        "4980423260322"
      )
    ),
    "Mureș"
  )

  expect_identical(
    extract_county(
      new_cnp(
        valid_cnps
      )
    ),
    counties
  )
})

test_that("extract_status works", {

  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  status_vec <- c("native", "resident", "native", NA)

  expect_identical(
    extract_status(
      new_cnp(
        valid_cnps
      )
    ),
    status_vec
  )

  expect_identical(
    extract_status(
      new_cnp(
        "6201206018078"
      )
    ),
    "native"
  )

  expect_identical(
    extract_status(
      new_cnp(
        "5201206346491"
      )
    ),
    "native"
  )

  expect_identical(
    extract_status(
      new_cnp(
        "1940616346114"
      )
    ),
    "native"
  )

  expect_identical(
    extract_status(
      new_cnp(
        "1940616346114"
      )
    ),
    "native"
  )

  expect_identical(
    extract_status(
      new_cnp(
        "7041218318525"
      )
    ),
    "resident"
  )

  expect_identical(
    extract_status(
      new_cnp(
        "7041218318525"
      )
    ),
    "resident"
  )
})
