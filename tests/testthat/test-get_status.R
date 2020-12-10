test_that("get_status works", {

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
        "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()")

    expect_error(get_status(62012060180782))

})