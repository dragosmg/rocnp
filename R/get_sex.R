#' Extract the Sex from the Personal Numeric Code
#'
#' This function extracts the sex based on the sex component `S` of the CNP.
#' It is worth noting that, at the moment of the implementation, Romanian
#' authorities define sex as binary. In the event of a sex change a new CNP
#' could be issued. The function returns an error if there is at least one
#' invalid CNP in the input vector, forcing you to confront the issue early. The
#' easiest way to get around this is to use `check_cnp_is_valid()`.
#'
#' @param cnp a 13-digit number (or a vector of 13-digit numbers) representing
#'     the Personal Numeric Code - CNP
#'
#' @return a character vector of the recorded sex: `M`, `F` (if the CNP is
#'     valid) or `NA_character` if the CNP is missing
#' @export
#'
#' @examples
#' get_sex(1940616346114)
#' get_sex(7041218318525)
#' get_sex(6201206018078)
#' get_sex(5201206346491)
#' get_sex(c(5201206346491, 1940616346114, 7041218318525, 6201206018078))
#' get_sex(c(5201206346491, 1940616346114, 7041218318525, NA))
get_sex <- function(cnp) {

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

    result <- purrr::map_chr(cnp_dec, get_sex_unvec)

    result
}

get_sex_unvec <- function(cnp_dec) {

    if (is.na(cnp_dec[["S"]])) {
        return(NA_character_)
    }

    if (cnp_dec["S"] %in% as.character(c(1, 3, 5, 7))) {
        return("M")
    }

    if (cnp_dec["S"] %in% as.character(c(2, 4, 6, 8))) {
        return("F")
    }
}
