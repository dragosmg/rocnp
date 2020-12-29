#' Extract Residence Status from the Personal Numeric Code
#'
#' @inheritParams get_sex
#' @param lang a string denoting the language for the status - either `RO` for
#'     Romanian (the default) or `EN` for English.
#'
#' @return a string denoting residence status in the language of choice
#' @export
#'
#' @examples
#' get_status(6201206018078)
#' get_status(5201206346491)
#' get_status(1940616346114)
#' get_status(1940616346114, lang = "EN")
#' get_status(7041218318525)
#' get_status(7041218318525, lang = "EN")
get_status <- function(cnp, lang = c("RO", "EN")) {

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

    lang <- match.arg(lang)

    result <- purrr::map2_chr(cnp_dec, lang, get_status_unvec)

    result
}

get_status_unvec <- function(cnp_dec, lang) {

    if (is.na(cnp_dec[["S"]])) {
        return(NA_character_)
    }

    if (cnp_dec["S"] %in% as.character(1:6)) {
        status_en <- "born in Romania"
        status_ro <- "nascut in Romania"
    }

    if (cnp_dec["S"] %in% as.character(7:8)) {
        status_en <- "resident"
        status_ro <- "rezident"
    }

    if (lang == "RO") {
        return(status_ro)
    } else {
        return(status_en)
    }
}
