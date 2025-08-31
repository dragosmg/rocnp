test_that("get_dob works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  dob_vec <- as.Date(c("1994-06-16", "2004-12-18", "1898-04-23", NA))

  expect_identical(
    get_dob(
      new_cnp("1940616346114")
    ),
    as.Date("1994-06-16")
  )

  expect_identical(
    get_dob(
      new_cnp("7041218318525")
    ),
    as.Date("2004-12-18")
  )

  expect_identical(
    get_dob(
      new_cnp(
        "6201206018078"
      )
    ),
    as.Date("2020-12-06")
  )

  expect_identical(
    get_dob(
      new_cnp(
        "7321206018072"
      )
    ),
    as.Date("1932-12-06")
  )

  expect_identical(
    get_dob(
      new_cnp(
        "4980423260322"
      )
    ),
    as.Date("1898-04-23")
  )

  expect_equal(
    get_dob(
      new_cnp(
        valid_cnps
      )
    ),
    dob_vec
  )
})
