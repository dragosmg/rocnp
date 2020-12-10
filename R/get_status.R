#' Extract Residence Status from the Personal Numeric Code
#'
#' @inheritParams interpret_cnp
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

    if (!suppressMessages(check_cnp_is_valid(cnp))) {
        stop(
            "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()",
            call. = FALSE)
    }

    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

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
