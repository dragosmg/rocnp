test_that("parse_sex() works", {
  cnp <- list(
    s = as.character(1:8)
  )

  expect_named(
    parse_sex(cnp),
    c("s", "sex")
  )

  expect_equal(
    parse_sex(cnp)[["sex"]],
    c("M", "F", "M", "F", "M", "F", "M", "F")
  )
})
