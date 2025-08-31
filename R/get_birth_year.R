#' Extract Year of Birth from the Personal Numeric Code
#'
#' Extract the year of birth, inferred starting from the `S` component, the
#' code for sex - which is also indicative of the century of birth - and the
#' `AA` component denoting the final 2 digits of the birth year. The year is
#' returned as string,
#'
#' @inheritParams get_sex
#'
#' @return a character vector representing the year of birth.
#' @export
#'
#' @examples
#' get_birth_year(cnp("1940616346114"))
#' get_birth_year(cnp("7041218318525"))
get_birth_year <- function(cnp) {
  vctrs::field(cnp, "yob")
}
