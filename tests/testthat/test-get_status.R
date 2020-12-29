test_that("get_status works", {

    valid_cnps <- c(1940616346114, 7041218318525, 4980423260322, NA)
    status_vec <- c("nascut in Romania", "rezident",
                    "nascut in Romania", NA_character_)

    expect_equal(get_status(valid_cnps),
                 status_vec)

    expect_equal(get_status(6201206018078), "nascut in Romania")

    expect_equal(get_status(5201206346491), "nascut in Romania")

    expect_equal(get_status(1940616346114), "nascut in Romania")

    expect_equal(get_status(1940616346114, lang = "EN"), "born in Romania")

    expect_equal(get_status(7041218318525), "rezident")

    expect_equal(get_status(7041218318525, lang = "EN"), "resident")

})

test_that("get_status complains", {

    expect_error(
        get_status("6201206018078"),
        paste("Please supply a vector of valid CNPs.",
              "The input vector has 1 invalid values.",
              "For a detailed diagnosis use check_cnp_is_valid()")
        )

    expect_error(get_status(62012060180782))

})
