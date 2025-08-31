test_that("decompose_cnp works", {
  a <- decompose_cnp(1940616346114)
  b <- list(
    s = "1",
    aa = "94",
    ll = "06",
    zz = "16",
    jj = "34",
    nnn = "611",
    c = "4",
    cnp = "1940616346114"
  )

  expect_identical(
    decompose_cnp(1940616346114),
    list(
      s = "1",
      aa = "94",
      ll = "06",
      zz = "16",
      jj = "34",
      nnn = "611",
      c = "4",
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

