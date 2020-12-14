#' Extract the Sex from the Personal Numeric Code
#'
#' This function extracts the sex based on the sex component `S`. Worth noting
#' that, at the moment of the implementation, Romanian authorities view sex as
#' binary and sex changes are allowed (cases in which a new CNP would be issued)
#'
#' @inheritParams interpret_cnp
#'
#' @return a string describing the sex in the desired language (either Romanian
#'     or English)
#' @export
#'
#' @examples
#' get_sex(1940616346114)
#' get_sex(7041218318525)
get_sex <- function(cnp, lang = c("RO", "EN")) {

    if (!suppressMessages(check_cnp_is_valid(cnp))) {
        stop(
            "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()",
            call. = FALSE)
    }

    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

    if (cnp_dec["S"] %in% as.character(c(1, 3, 5, 7))) {
        sex_en <- "masculine"
        sex_ro <- "masculin"
    }

    if (cnp_dec["S"] %in% as.character(c(2, 4, 6, 8))) {
        sex_en <- "feminine"
        sex_ro <- "feminin"
    }

    if (lang == "RO") {
        return(sex_ro)
    } else {
        return(sex_en)
    }
}
