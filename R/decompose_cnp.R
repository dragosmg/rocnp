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

  s_comp <- stringr::str_sub(x, start = 1L, end = 1L)

  aa_comp <- stringr::str_sub(x, start = 2L, end = 3L)

  ll_comp <- stringr::str_sub(x, start = 4L, end = 5L)

  zz_comp <- stringr::str_sub(x, start = 6L, end = 7L)

  jj_comp <- stringr::str_sub(x, start = 8L, end = 9L)

  nnn_comp <- stringr::str_sub(x, start = 10L, end = 12L)

  c_comp <- stringr::str_sub(x, start = 13L, end = 13L)

  output <- list(
    s = s_comp,
    aa = aa_comp,
    ll = ll_comp,
    zz = zz_comp,
    jj = jj_comp,
    nnn = nnn_comp,
    c = c_comp,
    cnp = x
  )

  output
}
