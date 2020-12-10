test_that("get_birth_year works", {
    a <- decompose_cnp(1940616346114)
    expect_equal(get_birth_year(a), "1994")

    b <- decompose_cnp(7041218318525)
    expect_equal(get_birth_year(b), "__04")

    c <- decompose_cnp(6201206018078)
    expect_equal(get_birth_year(c), "2020")

    d <- decompose_cnp(7321206018072)
    expect_equal(get_birth_year(d), "1932")

    e <- decompose_cnp(49804232603242)
    expect_equal(get_birth_year(e), "1898")
})
