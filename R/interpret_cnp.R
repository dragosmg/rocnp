#' Interpret the Personal Numeric Code
#'
#' This function offers a verbose interpretation of the Personal Numeric Code.
#'
#' @param cnp a 13-digit number representing the Personal Numeric Code - CNP
#' @param lang a string denoting the language for the interpretation - either
#'   `RO` for Romanian (the default) or `EN` for English.
#'
#' @return a character vector of length 1 containing a sentence interpreting the
#'   Personal Numeric Code.
#' @export
#'
#' @examples
#' interpret_cnp(6201206018078)
#' interpret_cnp(5201206346491, lang = "RO")
#' interpret_cnp(1940616346114)
#' interpret_cnp(1940616346114, lang = "EN")
#' interpret_cnp(7041218318525)
interpret_cnp <- function(cnp, lang = c("RO", "EN")) {
    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

    # extract the gender
    sex <- get_sex(cnp_dec, lang)

    # extract the year of birth
    birth_year <- get_birth_year(cnp_dec)

    # extract month
    birth_month <- get_birth_month(cnp_dec, lang)

    # extract the county in which the CNP was issued
    county <- get_county(cnp_dec)

    # extract status (native vs resident)
    status <- get_status(cnp_dec, lang)

    if (lang == "RO") {
        result <- glue::glue("Sexul: {sex},
                             Data nasterii: {cnp_dec['ZZ']} {birth_month} \\
                             {birth_year}
                             Judetul: {county}
                             Statut: {status}")

        return(result)
    }

    if (lang == "EN") {
        result <- glue::glue("Sex: {sex},
                             Date of birth: {birth_month} {cnp_dec['ZZ']}, \\
                             {birth_year},
                             County: {county},
                             Status: {status}")

        return(result)
    }
}

#' @rdname interpret_cnp
#' @export
interpreteaza_cnp <- interpret_cnp
