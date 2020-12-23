#' Extract County of Issue from the Personal Numeric Code
#'
#' @inheritParams interpret_cnp
#'
#' @return a string representing the name of the county where the CNP was issued
#' @export
#'
#' @examples
#' get_county(6201206018078)
#' get_county(5201206346491)
#' get_county(1940616346114)
#' get_county(7041218318525)
get_county <- function(cnp) {

    if (!suppressMessages(check_cnp_is_valid(cnp))) {
        stop(
            "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()",
            call. = FALSE)
    }

    cnp_dec <- decompose_cnp(cnp)

    county_code <- cnp_dec["JJ"]

    county_lookup %>%
        dplyr::filter(.data$code == county_code) %>%
        dplyr::pull(.data$county)
}
