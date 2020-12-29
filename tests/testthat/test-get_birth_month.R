test_that("get_birth_month works", {

    valid_cnps <- c(1940616346114, 7041218318525, 4980423260322, NA)
    month_vec_num <- c(6, 12, 4, NA_integer_)

    expect_equal(get_birth_month(valid_cnps),
                 month_vec_num)

    expect_equal(get_birth_month(1940616346114), 6L)

    expect_equal(get_birth_month(7041218318525), 12L)

    expect_equal(get_birth_month(6201206018078), 12L)

    expect_equal(get_birth_month(7321206018072), 12L)

    expect_equal(get_birth_month(4980423260322), 4L)
})

test_that("get_birth_month complains", {
    expect_error(
        get_birth_month(49804232603242),
        paste("Please supply a vector of valid CNPs.",
              "The input vector has 1 invalid values.",
              "For a detailed diagnosis use check_cnp_is_valid()")
    )

    expect_error(get_birth_month("1940616346114"))
})
