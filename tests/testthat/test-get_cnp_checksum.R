test_that("get_cnp_checksum works", {

    expect_equal(get_cnp_checksum(1940616346114), 4)

    expect_equal(get_cnp_checksum(7041218318525), 5)

    expect_equal(get_cnp_checksum(6201206018078), 8)

    expect_equal(get_cnp_checksum(7321206018072), 2)

    expect_equal(get_cnp_checksum(4980423260322), 2)

    expect_equal(get_cnp_checksum(6201228325231), 1)
})
