#' Extract the Month of Birth from the Personal Numeric Code
#'
#' This function extracts the month of birth starting from the `"LL"` component.
#' The month returned either as string (`long` and `short` variants) or numeric,
#' in the specified language, the default being Romanian.
#'
#' @inheritParams get_sex
#' @param lang a string denoting the language for the interpretation - either
#'     `RO` for Romanian (the default) or `EN` for English.
#'
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
#' cnps <- c(5201206346491, 1940616346114, 7041218318525, 6201206018078)
#' get_birth_month(cnps, lang = "EN", type = "short")
#' get_birth_month(cnps, lang = "RO")
#' get_birth_month(c(5201206346491, 1940616346114, 7041218318525, NA))
get_birth_month <- function(cnp,
                            lang = c("RO", "EN"),
                            type = c("long", "numeric", "short")) {

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

    type <- match.arg(type)

    arg_list <- list(cnp_dec = cnp_dec,
                     lang = rep(lang, length(cnp_dec)),
                     type = rep(type, length(cnp_dec)))

    if (type == "numeric") {
        result <- purrr::pmap_dbl(arg_list, get_birth_month_unvec)
    } else {
        result <- purrr::pmap_chr(arg_list, get_birth_month_unvec)
    }

    result
}

get_birth_month_unvec <- function(cnp_dec, lang, type) {

    # define a vector of month names in Romanian
    month_name_ro <- c("Ianuarie", "Februarie", "Martie", "Aprilie", "Mai",
                       "Iunie", "Iulie", "August", "Septembrie", "Octombrie",
                       "Noiembrie", "Decembrie")

    if (is.na(cnp_dec["LL"]) && type != "numeric") {
        return(NA_character_)
    }

    if (is.na(cnp_dec["LL"]) && type == "numeric") {
        return(NA_integer_)
    }

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
