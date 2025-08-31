#' Extract County of Issue from the Personal Numeric Code
#'
#' Extract the county based on the `JJ` component of the CNP and parse it.
#'
#' @inheritParams get_sex
#'
#' @return a character vector containing the names of the counties where the
#'   CNPs were issued.
#' @export
#'
#' @examples
#' get_county(new_cnp("1940616346114"))
#' get_county(new_cnp("7041218318525"))
#' get_county(new_cnp("6201206018078"))
#' get_county(new_cnp("5201206346491"))
#' get_county(new_cnp(c("5201206346491", "1940616346114", "7041218318525")))
#' get_county(new_cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
get_county <- function(cnp) {
  vctrs::field(cnp, "county")
}
