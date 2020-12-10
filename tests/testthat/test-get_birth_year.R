test_that("get_birth_year works", {
    expect_equal(get_birth_year(1940616346114), "1994")

    expect_equal(get_birth_year(7041218318525), "__04")

    expect_equal(get_birth_year(6201206018078), "2020")

    expect_equal(get_birth_year(7321206018072), "1932")

    expect_equal(get_birth_year(4980423260322), "1898")
})

test_that("get_birth_year complains", {
    expect_error(
        get_birth_year(49804232603242),
        "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()"
    )

    expect_error(get_birth_year("1940616346114"))
})
