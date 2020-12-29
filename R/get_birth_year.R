#' Extract Year of Birth from the Personal Numeric Code
#'
#' This function infers the year of birth based on the code for sex - which
#' is also indicative of the century of birth - and the `AA` component denoting
#' the final 2 digits of the birth year. The year is returned as string,
#' especially since for residents not born in Romania, there might be two
#' possible valid values for the birth year - in this case the year is returned
#' as `"__yy"`
#'
#' @inheritParams get_sex
#'
#' @return a character vector representing the year of birth (the century is
#'     unknown for non-natives)
#' @export
#'
#' @examples
#' get_birth_year(1940616346114)
#' get_birth_year(7041218318525)
get_birth_year <- function(cnp) {

    suppressMessages(
        checks <- check_cnp_is_valid(cnp)
    )

    if (any(checks == FALSE, na.rm = TRUE)) {
        invalid_cnps <- sum(checks == FALSE, na.rm = TRUE)
        stop_msg <- glue::glue("Please supply a vector of valid CNPs. The \\
                               input vector has {invalid_cnps} invalid \\
                               values. For a detailed diagnosis use \\
                               check_cnp_is_valid()")
        stop(stop_msg, call. = FALSE)
    }

    cnp_dec <- purrr::map(cnp, decompose_cnp)

    result <- purrr::map_chr(cnp_dec, get_birth_year_unvec)

    result
}

get_birth_year_unvec <- function(cnp_dec) {

    if (is.na(cnp_dec["S"]) || is.na(cnp_dec["AA"])) {
        return(NA_character_)
    }

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

    if (cnp_dec["S"] %in% c("7", "8")) {
        birth_year <- stringr::str_c("__", cnp_dec["AA"])
        return(birth_year)
    }
}
