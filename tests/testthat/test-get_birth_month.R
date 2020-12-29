test_that("get_birth_month works", {

    valid_cnps <- c(1940616346114, 7041218318525, 4980423260322, NA)
    month_vec_ro <- c("Iunie", "Decembrie", "Aprilie", NA_character_)
    month_vec_ro_short <- c("Iun", "Dec", "Apr", NA_character_)
    month_vec_eng <- c("June", "December", "April", NA_character_)
    month_vec_eng_short <- c("Jun", "Dec", "Apr", NA_character_)
    month_vec_num <- c(6, 12, 4, NA_integer_)

    expect_equal(get_birth_month(valid_cnps), month_vec_ro)
    expect_equal(get_birth_month(valid_cnps, type = "short"),
                 month_vec_ro_short)

    expect_equal(get_birth_month(valid_cnps, lang = "EN", type = "long"),
                 month_vec_eng)
    expect_equal(get_birth_month(valid_cnps, lang = "EN", type = "short"),
                 month_vec_eng_short)

    expect_equal(get_birth_month(valid_cnps, type = "numeric"),
                 month_vec_num)

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
        "Please supply a vector of valid CNPs. The input vector has 1 invalid values. For a detailed diagnosis use check_cnp_is_valid()"
    )

    expect_error(get_birth_month("1940616346114"))
})
