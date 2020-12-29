#' Split the CNP into its components
#'
#' A CNP is made up of 13 digits each with a specific meaning:
#'     * `S` - the first digit is indicative of gender
#'     * `AA` - digits 2-3 represent the last 2 digits of the year of birth
#'     * `LL` - digits 4-5 represent the month of birth
#'     * `ZZ` - digits 6-7 represent the day of birth
#'     * `JJ` - digits 8-9 represent the county of birth (for native Romanians)
#'     or the county of issue (for residents)
#'     * `NNN`- digits 10-12 number between 001 and 999 used to differentiate
#'     between people born on the same day in the same county
#'     * `C` - digit 13 checksum
#'
#' @inheritParams get_sex
#'
#' @return a named character vector splitting the CNP into its components.
#' @export
#'
#' @examples
#' decompose_cnp(6201206018078)
#' decompose_cnp(5201206346491)
decompose_cnp <- function(cnp) {
    cnp_string <- as.character(cnp)

    s <- stringr::str_sub(cnp_string, start = 1, end = 1)

    aa <- stringr::str_sub(cnp_string, start = 2, end = 3)

    ll <- stringr::str_sub(cnp_string, start = 4, end = 5)

    zz <- stringr::str_sub(cnp_string, start = 6, end = 7)

    jj <- stringr::str_sub(cnp_string, start = 8, end = 9)

    nnn <- stringr::str_sub(cnp_string, start = 10, end = 12)

    c <- stringr::str_sub(cnp_string, start = 13, end = 13)

    result <- c("S" = s, "AA" = aa, "LL" = ll, "ZZ" = zz, "JJ" = jj,
                 "NNN" = nnn, "C" = c)

    result
}
