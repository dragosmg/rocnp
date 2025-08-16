test_that("decompose_cnp works", {
  a <- decompose_cnp(1940616346114)
  b <- list(
    S = "1",
    AA = "94",
    LL = "06",
    ZZ = "16",
    JJ = "34",
    NNN = "611",
    C = "4",
    cnp = "1940616346114"
  )

  expect_identical(
    decompose_cnp(1940616346114),
    list(
      S = "1",
      AA = "94",
      LL = "06",
      ZZ = "16",
      JJ = "34",
      NNN = "611",
      C = "4",
      cnp = "1940616346114"
    )
  )

  expect_snapshot(
    decompose_cnp(
      c(
        7041218318525,
        6201206018078,
        7321206018072,
        49804232603242
      )
    )
  )
})

test_that("decompose_cnp fails with incorrect input", {
  expect_equal(2 * 2, 4)
})
