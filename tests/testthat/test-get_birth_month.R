test_that("get_birth_month works", {
    expect_equal(get_birth_month(1940616346114), "Iunie")
    expect_equal(get_birth_month(1940616346114, type = "numeric"), 6)
    expect_equal(get_birth_month(1940616346114, type = "short"), "Iun")

    # English
    expect_equal(get_birth_month(1940616346114, lang = "EN"), "June")
    expect_equal(
        get_birth_month(1940616346114, lang = "EN", type = "numeric"),
        6)
    expect_equal(
        get_birth_month(1940616346114, lang = "EN", type = "short"), "Jun")


    expect_equal(get_birth_month(7041218318525), "Decembrie")

    expect_equal(get_birth_month(6201206018078), "Decembrie")

    expect_equal(get_birth_month(7321206018072), "Decembrie")

    expect_equal(get_birth_month(4980423260322), "Aprilie")
})

test_that("get_birth_month complains", {
    expect_error(
        get_birth_month(49804232603242),
        "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()"
    )

    expect_error(get_birth_month("1940616346114"))
})
