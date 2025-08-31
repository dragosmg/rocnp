#' Split the CNP into its components
#'
#' `decompose_cnp()` is a lower level helper that is used to break down a string
#' representing a CNP into its components.
#'
#' A CNP is made up of 13 digits each with a specific meaning:
#'  * `S` - digit 1 encodes sex at birth
#'  * `AA` - digits 2-3 represent the last 2 digits of the year of birth
#'  * `LL` - digits 4-5 represent the month of birth
#'  * `ZZ` - digits 6-7 represent the day of birth
#'  * `JJ` - digits 8-9 represent the county of birth (for native Romanians)
#'  or the county of issue (for residents)
#'  * `NNN`- digits 10-12 number between 001 and 999 used to differentiate
#'  between people born on the same day in the same county
#'  * `C` - digit 13 checksum
#'
#' @param x (character) a vector of CNPs.
#'
#' @return a list containing the CNP components and the full CNP.
#' @keywords internal
#'
#' @examples
#' rocnp:::decompose_cnp(6201206018078)
#' rocnp:::decompose_cnp(5201206346491)
decompose_cnp <- function(x) {
  x <- as.character(x)

  s <- stringr::str_sub(x, start = 1, end = 1)

  aa <- stringr::str_sub(x, start = 2, end = 3)

  ll <- stringr::str_sub(x, start = 4, end = 5)

  zz <- stringr::str_sub(x, start = 6, end = 7)

  jj <- stringr::str_sub(x, start = 8, end = 9)

  nnn <- stringr::str_sub(x, start = 10, end = 12)

  c <- stringr::str_sub(x, start = 13, end = 13)

  output <- list(
    s = s,
    aa = aa,
    ll = ll,
    zz = zz,
    jj = jj,
    nnn = nnn,
    c = c,
    cnp = x
  )

  output
}
