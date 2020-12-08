#' Extract Birth Year from the Personal Numeric Code
#'
#' This function infers the year of birth based on the code for gender - which
#' is indicative of the century of birth - and the `AA` component denoting the
#' last 2 digits of the birth year. The main purpose of this function is to help
#' the `interpret_cnp()` functionality. Thus, the year is returned as string,
#' especially since for residents not born in Romania, there might be two
#' possible valid values for the birth year.
#'
#' @param cnp_dec a named character vector representing a decomposed Personal
#'     Numeric Code
#' @inheritParams interpret_cnp
#'
#' @return an string representing the year of birth or the possible years (in
#'     the case of residents)
#' @export
#'
#' @examples
#' a <- decompose_cnp(1940616346114)
#' get_birth_year(a)
#' b <- decompose_cnp(7041218318525)
#' get_birth_year(b)
get_birth_year <- function(cnp_dec, lang = c("RO", "EN")) {

    lang <- match.arg(lang)

    if (cnp_dec["S"] %in% as.character(c(1, 2))) {
        birth_year <- stringr::str_c(19, cnp_dec["AA"])
        return(birth_year)
    }

    if (cnp_dec["S"] %in% as.character(c(3, 4))) {
        birth_year <- stringr::str_c(18, cnp_dec["AA"])
        return(birth_year)
    }

    if (cnp_dec["S"] %in% as.character(c(5, 6))) {
        birth_year <- stringr::str_c(20, cnp_dec["AA"])
        return(birth_year)
    }

    this_year_2d <- lubridate::today() %>%
        lubridate::year() %>%
        stringr::str_sub(3, 4) %>%
        as.integer()

    if (lang == "RO") {
        prep <- "sau"
    } else {
        prep <- "or"
    }

    # this assumes that Romanian residents born in a different country are under
    # the age of 100
    if (cnp_dec["S"] %in% c("7", "8") &&
        as.integer(cnp_dec["AA"]) <= this_year_2d) {
        birth_year <- glue::glue("{stringr::str_c(20, cnp_dec['AA'])} \\
                                 {prep} {stringr::str_c(19, cnp_dec['AA'])}")
        return(birth_year)
    } else {
        birth_year <- stringr::str_c(19, cnp_dec["AA"])
        return(birth_year)
    }
}
