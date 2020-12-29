test_that("check_cnp_is_valid works", {
    cnps <- c(1940616346114, 7041218318525, 49804232603223, NA)
    validity <- c(TRUE, TRUE, FALSE, NA)

    expect_equal(check_cnp_is_valid(cnps),
                 validity)

    # CNP is correct
    expect_true(check_cnp_is_valid(6201206018078))

    # char instead of number
    expect_false(check_cnp_is_valid("6201206018078"))
    expect_message(check_cnp_is_valid("6201206018078"),
                   paste0("CNP should be a number. You supplied a character."))

    # too long
    expect_false(check_cnp_is_valid(62012060180781))
    expect_equal(check_cnp_is_valid(c(6201206018078, 62012060180781)),
                 c(TRUE, FALSE))
    expect_message(check_cnp_is_valid(62012060180781),
                   paste0("CNP is made up of 13 digits. You supplied a ",
                          "number made up of 14 digits."))

    # too short
    expect_false(check_cnp_is_valid(620120601807))
    expect_message(check_cnp_is_valid(620120601807),
                   paste0("CNP is made up of 13 digits. You supplied a ",
                          "number made up of 12 digits."))

    # first digit is 9
    expect_false(
        suppressMessages(
            check_cnp_is_valid(9201206018078)
        )
    )
    expect_message(check_cnp_is_valid(9201206018078),
                   paste0("The 'S' component - first digit - should be ",
                          "between 1 and 8. Your number has 9 as first digit."))

    # month component is not 1:12
    expect_false(check_cnp_is_valid(6201306018078))

    # date of birth February 30
    expect_false(check_cnp_is_valid(6200230018078))
    expect_message(check_cnp_is_valid(6200230018078),
                   paste0("The 'ZZ' component should not be more than 29 - ",
                          "the maximum number of days in February. The 'ZZ' ",
                          "component for your number is 30."))

    # date of birth April 31
    expect_false(check_cnp_is_valid(6200431018078))
    expect_message(check_cnp_is_valid(6200431018078),
                 paste0("The 'ZZ' component should not be more than 30 - the ",
                        "maximum number of days in April. The 'ZZ' component ",
                        "for your number is 31."))

    # checksum failure
    expect_false(check_cnp_is_valid(6201206018075))
    expect_message(check_cnp_is_valid(6201206018075),
                   "The checksum does not match the expected value.")
})
