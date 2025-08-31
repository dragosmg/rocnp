test_that("get_sex works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  sex_vec <- c("M", "M", "F", NA_character_)

  expect_equal(
    get_sex(
      new_cnp("1940616346114")
    ),
    "M"
  )

  expect_equal(
    get_sex(
      new_cnp("7041218318525")
    ),
    "M"
  )

  expect_equal(
    get_sex(
      new_cnp(
        "6201206018078"
      )
    ),
    "F"
  )

  expect_equal(
    get_sex(
      new_cnp(
        "7321206018072"
      )
    ),
    "M"
  )

  expect_equal(
    get_sex(
      new_cnp(
        "4980423260322"
      )
    ),
    "F"
  )

  expect_equal(
    get_sex(
      new_cnp(
        valid_cnps
      )
    ),
    sex_vec
  )
})
