test_that("get_county works", {
    expect_equal(get_county(1940616346114), "Teleorman")

    expect_equal(get_county(7041218318525), "Sălaj")

    expect_equal(get_county(6201206018078), "Alba")

    expect_equal(get_county(7321206018072), "Alba")

    expect_equal(get_county(4980423260322), "Mureș")
})

test_that("get_county complains", {
    expect_error(
        get_county(49804232603242),
        "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()"
    )

    expect_error(get_county("1940616346114"))
})