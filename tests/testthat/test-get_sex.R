test_that("get_sex works", {
    valid_cnps <- c(1940616346114, 7041218318525, 4980423260322, NA)
    sex_vec <- c("M", "M", "F", NA_character_)

    expect_equal(get_sex(1940616346114), "M")

    expect_equal(get_sex(7041218318525), "M")

    expect_equal(get_sex(6201206018078), "F")

    expect_equal(get_sex(7321206018072), "M")

    expect_equal(get_sex(4980423260322), "F")

    expect_equal(get_sex(valid_cnps), sex_vec)
})

test_that("get_sex complains", {
    expect_error(
        get_sex(49804232603242),
        paste("Please supply a vector of valid CNPs.",
              "The input vector has 1 invalid values.",
              "For a detailed diagnosis use check_cnp_is_valid()")
    )

    expect_error(get_sex("1940616346114"))
})
