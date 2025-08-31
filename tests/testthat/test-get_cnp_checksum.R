test_that("get_cnp_checksum works", {

  expect_equal(get_cnp_checksum(1940616346114), 4L)

  expect_equal(get_cnp_checksum(7041218318525), 5L)

  expect_equal(get_cnp_checksum(6201206018078), 8L)

  expect_equal(get_cnp_checksum(7321206018072), 2L)

  expect_equal(get_cnp_checksum(4980423260322), 2L)

  expect_equal(get_cnp_checksum(6201228325231), 1L)
})
