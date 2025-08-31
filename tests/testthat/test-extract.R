test_that("cnp_sex() works", {

  cnps <- cnp(
    c(
      "1940616346114",
      "7041218318525",
      "4980423260322",
      NA
    )
  )

  expect_identical(
    cnp_sex(
      cnps
    )
  )

})
