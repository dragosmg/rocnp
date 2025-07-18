test_that("get_county works", {
  valid_cnps <- c(1940616346114, 7041218318525, 4980423260322, NA)
  counties <- c("Teleorman", "Sălaj", "Mureș", NA_character_)

  expect_equal(get_county(1940616346114), "Teleorman")

  expect_equal(get_county(7041218318525), "Sălaj")

  expect_equal(get_county(6201206018078), "Alba")

  expect_equal(get_county(7321206018072), "Alba")

  expect_equal(get_county(4980423260322), "Mureș")

  expect_equal(get_county(valid_cnps), counties)
})

test_that("get_county complains", {
  expect_snapshot_error(
    get_county(49804232603242)
  )

  expect_error(get_county("1940616346114"))
})
