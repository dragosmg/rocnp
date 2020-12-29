#' Extract the Month of Birth from the Personal Numeric Code
#'
#' This function extracts the month of birth starting from the `"LL"` component.
#'
#' @inheritParams get_sex
#'
#' @return a numeric vector representing the month of birth
#' @export
#'
#' @examples
#' get_birth_month(1940616346114)
#' get_birth_month(7041218318525)
#' cnps <- c(5201206346491, 1940616346114, 7041218318525, 6201206018078)
#' get_birth_month(cnps)
#' get_birth_month(c(5201206346491, 1940616346114, 7041218318525, NA))
get_birth_month <- function(cnp) {

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


    result <- purrr::map_int(cnp_dec, get_birth_month_unvec)

    result
}

get_birth_month_unvec <- function(cnp_dec, lang, type) {

    if (is.na(cnp_dec["LL"])) {
        return(NA_integer_)
    }

    month <- as.integer(cnp_dec["LL"])

    month
}
