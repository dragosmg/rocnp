#' Extract the Month of Birth from the Personal Numeric Code
#'
#' This function extracts the month of birth starting from the `"LL"` component.
#' The month returned either as string (`long` and `short` variants) or numeric,
#' in the specified language, the default being Romanian.
#'
#' @inheritParams interpret_cnp
#' @inheritParams get_birth_year
#' @param type string indicating type of output desired, one of `"long"`, full
#'     month name (default), `"short"`, short month name, and `"numeric"`
#'
#' @return a string or numeric depending on the requested output
#' @export
#'
#' @examples
#' get_birth_month(1940616346114)
#' get_birth_month(1940616346114, type = "short")
#' get_birth_month(1940616346114, type = "numeric")
#' get_birth_month(7041218318525, lang = "EN")
#' get_birth_month(7041218318525, lang = "EN", type = "long")
#' get_birth_month(7041218318525, lang = "EN", type = "numeric")
#' get_birth_month(7041218318525, lang = "EN", type = "short")
get_birth_month <- function(cnp,
                            lang = c("RO", "EN"),
                            type = c("long", "numeric", "short")) {

    if (!suppressMessages(check_cnp_is_valid(cnp))) {
        stop(
            "Please supply a valid CNP. For diagnosis use check_cnp_is_valid()",
            call. = FALSE)
    }

    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

    type <- match.arg(type)

    # define a vector of month names in Romanian
    month_name_ro <- c("Ianuarie", "Februarie", "Martie", "Aprilie", "Mai",
                       "Iunie", "Iulie", "August", "Septembrie", "Octombrie",
                       "Noiembrie", "Decembrie")

    if (type == "numeric") {
        month <- as.numeric(cnp_dec["LL"])
        return(month)
    }

    if (lang == "RO" && type == "long") {
        month <- month_name_ro[as.numeric(cnp_dec["LL"])]
        return(month)
    } else if (lang == "RO" && type == "short") {
        month <- month_name_ro[as.numeric(cnp_dec["LL"])] %>%
            stringr::str_sub(start = 1L, end = 3L)
        return(month)
    } else if (lang == "EN" && type == "long") {
        month <- month.name[as.numeric(cnp_dec["LL"])]
        return(month)
    } else {
        month <- month.abb[as.numeric(cnp_dec["LL"])]
        return(month)
    }
}
