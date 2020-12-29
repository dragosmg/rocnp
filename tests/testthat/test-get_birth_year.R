test_that("get_birth_year works", {
    valid_cnps <- c(1940616346114, 7041218318525, 4980423260322, NA)
    birth_year_vec <- c("1994", "__04", "1898", NA_character_)

    expect_equal(get_birth_year(valid_cnps),
                 birth_year_vec)

    expect_equal(get_birth_year(1940616346114), "1994")

    expect_equal(get_birth_year(7041218318525), "__04")

    expect_equal(get_birth_year(6201206018078), "2020")

    expect_equal(get_birth_year(7321206018072), "__32")

    expect_equal(get_birth_year(4980423260322), "1898")
})

test_that("get_birth_year complains", {
    expect_error(
        get_birth_year(49804232603242),
        paste("Please supply a vector of valid CNPs.",
              "The input vector has 1 invalid values.",
              "For a detailed diagnosis use check_cnp_is_valid()")
    )

    expect_error(get_birth_year("1940616346114"))
})
