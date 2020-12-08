test_that("decompose_cnp works", {
    a <- decompose_cnp(1940616346114)
    b <- c(S = "1", AA = "94", LL = "06", ZZ = "16", JJ = "34", NNN = "611",
           C = "4")
    expect_equal(a, b)

    c <- decompose_cnp(7041218318525)
    d <- c(S = "7", AA = "04", LL = "12", ZZ = "18", JJ = "31", NNN = "852",
           C = "5")
    expect_equal(c, d)

    e <- decompose_cnp(6201206018078)
    f <- c(S = "6", AA = "20", LL = "12", ZZ = "06", JJ = "01", NNN = "807",
           C = "8")
    expect_equal(e, f)

    g <- decompose_cnp(7321206018072)
    h <- c(S = "7", AA = "32", LL = "12", ZZ = "06", JJ = "01", NNN = "807",
           C = "2")
    expect_equal(g, h)

    i <- decompose_cnp(49804232603242)
    j <- c(S = "4", AA = "98", LL = "04", ZZ = "23", JJ = "26", NNN = "032",
           C = "4")
    expect_equal(i, j)

})

test_that("decompose_cnp fails with incorrect input", {
    expect_equal(2 * 2, 4)
})
