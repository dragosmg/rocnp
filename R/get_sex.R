#' Extract the Sex from the Personal Numeric Code
#'
#' This function extracts the sex based on the sex component `S`. Worth noting
#' that, at the moment of the implementation, Romanian authorities view sex as
#' binary. In the event of a sex change a new CNP is issued.
#'
#' @inheritParams interpret_cnp
#'
#' @return a character vector of `M` and/ or `F`
#' @export
#'
#' @examples
#' get_sex(1940616346114)
#' get_sex(7041218318525)
#' get_sex(6201206018078)
#' get_sex(5201206346491)
get_sex <- function(cnp) {

    suppressMessages(
        checks <- check_cnp_is_valid(cnp)
    )

    if (any(checks == FALSE)) {
        msg <- glue::glue("Please supply a vector of valid CNPs. At least \\
                              one of the supplied values is not valid. For \\
                              diagnosis use check_cnp_is_valid()")
        stop(msg, call. = FALSE)
    }

    cnp_dec <- purrr::map(cnp, decompose_cnp)

    result <- purrr::map_chr(cnp_dec, get_sex_unvec)

    result
}

get_sex_unvec <- function(cnp_dec) {



    if (cnp_dec["S"] %in% as.character(c(1, 3, 5, 7))) {
        sex <- "M"
        return(sex)
    }

    if (cnp_dec["S"] %in% as.character(c(2, 4, 6, 8))) {
        sex <- "F"
        return(sex)
    }
}
