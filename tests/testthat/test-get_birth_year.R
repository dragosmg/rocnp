test_that("get_birth_year works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  birth_year_vec <- c("1994", "2004", "1898", NA)

  expect_identical(
    get_birth_year(
      new_cnp(
        valid_cnps
      )
    ),
    birth_year_vec
  )

  expect_equal(
    get_birth_year(
      new_cnp(
        "1940616346114"
      )
    ),
    "1994"
  )

  expect_equal(
    get_birth_year(
      new_cnp(
        "7041218318525"
      )
    ),
    "2004"
  )

  expect_equal(
    get_birth_year(
      new_cnp(
        "6201206018078"
      )
    ),
    "2020"
  )

  expect_equal(
    get_birth_year(
      new_cnp(
        "7321206018072"
      )
    ),
    "1932"
  )

  expect_equal(
    get_birth_year(
      new_cnp(
        "4980423260322"
      )
    ),
    "1898"
  )
})
