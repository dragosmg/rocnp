#' Check if a CNP is valid
#'
#' @inheritParams get_sex
#'
#' @return a logical vector (`TRUE`, `FALSE` or `NA`)
#' @export
#'
#' @examples
#' check_cnp_is_valid(1940616346114)
#' check_cnp_is_valid(7041218318525)
#' check_cnp_is_valid(62012060180783)
#' check_cnp_is_valid(NA)
check_cnp_is_valid <- function(cnp) {
    purrr::map_lgl(cnp, check_cnp_is_valid_unvec)
}

check_cnp_is_valid_unvec <- function(cnp) {

    if (is.na(cnp)) {
        msg <- "This value is missing"
        message(msg)
        return(NA)
    }

    if (!is.numeric(cnp)) {
        msg <- glue::glue(
            "CNP should be a number. You supplied a {typeof(cnp)}.")
        message(msg)
        return(FALSE)
    }

    if (nchar(cnp) != 13) {
        msg <- glue::glue("CNP is made up of 13 digits. You supplied a number \\
                          made up of {nchar(cnp)} digits.")
        message(msg)
        return(FALSE)
    }

    cnp_dec <- decompose_cnp(cnp)

    if (!(cnp_dec["S"] %in% as.character(1:8))) {
        msg <- glue::glue("The 'S' component - first digit - should be \\
                          between 1 and 8. Your number has {cnp_dec['S']} as \\
                          first digit.")
        message(msg)
        return(FALSE)
    }

    valid_months <- as.character(1:12) %>%
        stringr::str_pad(width = 2, side = "left", pad = "0")


    if (!(cnp_dec["LL"] %in% valid_months)) {
        msg <- glue::glue("The months component ('LL') should be between 01 \\
                          and 12. The 'LL' component for your number is \\
                          {cnp_dec['LL']}.")
        message(msg)
        return(FALSE)
    }

    cnp_month <- cnp_dec["LL"] %>% as.numeric()
    max_days_in_month <- tibble::tibble(
        month = 1:12,
        max_days = c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)) %>%
        dplyr::filter(.data$month == cnp_month) %>%
        dplyr::pull(.data$max_days)

    if (as.numeric(cnp_dec["ZZ"]) > max_days_in_month) {
        msg <- glue::glue("The 'ZZ' component should not be more than \\
                          {max_days_in_month} - the maximum number of days in \\
                          {month.name[cnp_month]}. The 'ZZ' component for \\
                          your number is {cnp_dec['ZZ']}.")
        message(msg)
        return(FALSE)
    }

    checksum <- get_cnp_checksum(cnp)

    if (checksum != cnp_dec["C"]) {
        message("The checksum does not match the expected value.")
        return(FALSE)
    }

    TRUE
}
