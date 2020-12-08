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
#' interpret_cnp(7041218318525)
interpret_cnp <- function(cnp, lang = c("RO", "EN")) {
    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

    # extract the gender
    gender <- get_gender(cnp_dec, lang)

    # extract the year of birth
    birth_year <- get_birth_year(cnp_dec, lang)

    # extract month
    birth_month <- get_birth_month(cnp_dec, lang)

    # extract the county in which the CNP was issued
    county <- get_county(cnp_dec)

    # extract status (native vs resident)
    status <- get_status(cnp_dec)

    if (lang == "RO" && status == "native") {
        result <- glue::glue("Acest CNP apartine unei persoane de sex \\
                             {gender}, nascuta pe data de {cnp_dec['ZZ']} \\
                             {birth_month} {birth_year} in judetul {county}.")

        return(result)
    }

    if (lang == "RO" && status == "resident") {
        result <- glue::glue("Acest CNP apartine unei persoane de sex \\
                             {gender}, nascuta pe data de {cnp_dec['ZZ']} \\
                             {birth_month} {birth_year} in afara Romaniei. \\
                             Acest CNP a fost eliberat in judetul {county}.")

        return(result)
    }

    if (lang == "EN" && status == "native") {
        result <- glue::glue("This CNP belongs to a {gender} born on \\
                             {birth_month} {cnp_dec['ZZ']} {birth_year} in \\
                             the {county} county.")

        return(result)
    }

    if (lang == "EN" && status == "resident") {
        result <- glue::glue("This CNP belongs to a {gender} born on \\
                             {birth_month} {cnp_dec['ZZ']}, {birth_year} \\
                             outside Romania. This CNP was issued in the \\
                             {county} county.")

        return(result)
    }
}

#' @rdname interpret_cnp
#' @export
interpreteaza_cnp <- interpret_cnp
