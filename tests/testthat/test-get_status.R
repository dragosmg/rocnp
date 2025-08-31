test_that("get_status works", {

  valid_cnps <- c("1940616346114", "7041218318525", "4980423260322", NA)
  status_vec <- c("native", "resident", "native", NA)

  expect_identical(
    get_status(
      new_cnp(
        valid_cnps
      )
    ),
    status_vec
  )

  expect_identical(
    get_status(
      new_cnp(
        "6201206018078"
      )
    ),
    "native"
  )

  expect_identical(
    get_status(
      new_cnp(
        "5201206346491"
      )
    ),
    "native"
  )

  expect_identical(
    get_status(
      new_cnp(
        "1940616346114"
      )
    ),
    "native"
  )

  expect_identical(
    get_status(
      new_cnp(
        "1940616346114"
      )
    ),
    "native"
  )

  expect_identical(
    get_status(
      new_cnp(
        "7041218318525"
      )
    ),
    "resident"
  )

  expect_identical(
    get_status(
      new_cnp(
        "7041218318525"
      )
    ),
    "resident"
  )
})
