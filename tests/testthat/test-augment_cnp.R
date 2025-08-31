test_that("parse_sex() works", {
  cnp <- list(
    s = as.character(1L:8L)
  )

  expect_named(
    parse_sex(cnp),
    c("s", "sex")
  )

  expect_identical(
    parse_sex(cnp)[["sex"]],
    c("M", "F", "M", "F", "M", "F", "M", "F")
  )
})
