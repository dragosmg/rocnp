#' Extract County of Issue from the Personal Numeric Code
#'
#' @inheritParams get_sex
#'
#' @return a string representing the name of the county where the CNP was issued
#' @export
#'
#' @examples
#' get_county(6201206018078)
#' get_county(5201206346491)
#' get_county(1940616346114)
#' get_county(7041218318525)
get_county <- function(cnp) {

  suppressMessages(
    checks <- check_cnp_is_valid(cnp)
  )

  if (any(checks == FALSE, na.rm = TRUE)) {
    # nolint start: object_usage_linter
    invalid_cnps <- sum(checks == FALSE, na.rm = TRUE)
    cli::cli_abort(
      "Please supply a vector of valid CNPs. The input vector has \\
      {invalid_cnps} invalid values. For a detailed diagnosis use \\
      {.code check_cnp_is_valid()}."
    )
    # nolint end
  }

  cnp_dec <- purrr::map(cnp, decompose_cnp)

  result <- purrr::map_chr(cnp_dec, get_county_unvec)

  result
}

get_county_unvec <- function(cnp_dec) {

  county_code <- cnp_dec["JJ"]

  if (is.na(cnp_dec[["JJ"]])) {
    return(NA_character_)
  }

  county_lookup |>
    dplyr::filter(.data$code == county_code) |>
    dplyr::pull(.data$county)
}
