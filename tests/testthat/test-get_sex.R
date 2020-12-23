test_that("get_sex works", {
    expect_equal(get_sex(1940616346114), "M")

    expect_equal(get_sex(7041218318525), "M")

    expect_equal(get_sex(6201206018078), "F")

    expect_equal(get_sex(7321206018072), "M")

    expect_equal(get_sex(4980423260322), "F")
})

test_that("get_sex complains", {
    expect_error(
        get_sex(49804232603242),
        "Please supply a vector of valid CNPs. At least one of the supplied values is not valid. For diagnosis use check_cnp_is_valid()"
    )

    expect_error(get_sex("1940616346114"))
})
