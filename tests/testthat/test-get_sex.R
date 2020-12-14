test_that("get_sex works", {
    expect_equal(get_sex(1940616346114), "masculin")
    expect_equal(get_sex(1940616346114, lang = "EN"), "masculine")

    expect_equal(get_sex(7041218318525), "masculin")
    expect_equal(get_sex(7041218318525, lang = "EN"), "masculine")

    expect_equal(get_sex(6201206018078), "feminin")
    expect_equal(get_sex(6201206018078, lang = "EN"), "feminine")

    expect_equal(get_sex(7321206018072), "masculin")

    expect_equal(get_sex(4980423260322), "feminin")
})

test_that("get_sex complains", {
    expect_error(
        get_sex(49804232603242),
        "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()"
    )

    expect_error(get_sex("1940616346114"))
})
