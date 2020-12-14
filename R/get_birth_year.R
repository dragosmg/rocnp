#' Extract Year of Birth from the Personal Numeric Code
#'
#' This function infers the year of birth based on the code for sex - which
#' is indicative of the century of birth - and the `AA` component denoting the
#' last 2 digits of the birth year. The main purpose of this function is to help
#' the `interpret_cnp()` functionality. Thus, the year is returned as string,
#' especially since for residents not born in Romania, there might be two
#' possible valid values for the birth year.
#'
#' @inheritParams interpret_cnp
#'
#' @return a string representing the year of birth or the possible years (in
#'     the case of residents)
#' @export
#'
#' @examples
#' get_birth_year(1940616346114)
#' get_birth_year(7041218318525)
get_birth_year <- function(cnp) {

    if (!suppressMessages(check_cnp_is_valid(cnp))) {
        stop(
            "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()",
            call. = FALSE)
    }

    cnp_dec <- decompose_cnp(cnp)

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

    this_year_2d <- lubridate::today(tzone = "UTC") %>%
        lubridate::year() %>%
        stringr::str_sub(3, 4) %>%
        as.integer()

    if (cnp_dec["S"] %in% c("7", "8") &&
        as.integer(cnp_dec["AA"]) <= this_year_2d) {
        birth_year <- stringr::str_c("__", cnp_dec["AA"])
        return(birth_year)
    } else {
        birth_year <- stringr::str_c(19, cnp_dec["AA"])
        return(birth_year)
    }
}
