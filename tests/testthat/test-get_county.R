test_that("get_county works", {
  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  counties <- c("Teleorman", "Sălaj", "Mureș", NA_character_)

  expect_identical(
    get_county(
      new_cnp(
        "1940616346114"
      )
    ),
    "Teleorman"
  )

  expect_identical(
    get_county(
      new_cnp(
        "7041218318525"
      )
    ),
    "Sălaj"
  )

  expect_identical(
    get_county(
      new_cnp(
        "6201206018078"
      )
    ),
    "Alba"
  )

  expect_identical(
    get_county(
      new_cnp("7321206018072")
    ),
    "Alba"
  )

  expect_identical(
    get_county(
      new_cnp(
        "4980423260322"
      )
    ),
    "Mureș"
  )

  expect_identical(
    get_county(
      new_cnp(
        valid_cnps
      )
    ),
    counties
  )
})
