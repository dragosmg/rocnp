

# * `S` - digit 1 encodes sex at birth
# * `AA` - digits 2-3 represent the last 2 digits of the year of birth
# * `LL` - digits 4-5 represent the month of birth
# * `ZZ` - digits 6-7 represent the day of birth
# * `JJ` - digits 8-9 represent the county of birth (for native Romanians)
# or the county of issue (for residents)
# * `NNN`- digits 10-12 number between 001 and 999 used to differentiate
# between people born on the same day in the same county
# * `C` - digit 13 checksum

#' Extract CNP components
#'
#' @description
#' The `extract_()` family of functions provides tools to extract the different
#' pieces of information encoded in the CNP. These functions return a character
#' vector:
#'
#' * `extract_sex()` extracts the sex (`"M"` or `"F"`) based on the `S`
#' component of the CNP.
#' * `extract_birth_year()` extracts the year of birth, inferred from the `S`
#' (which also encodes the century of birth, alongside the sex ) and `AA`
#' (encoding the final 2 digits of the birth year) components of the CNP.
#' * `extract_birth_month()` extracts the month of birth based on the `"LL"`
#' component.
#' * `extract_county()` get the county of issue (based on the `JJ` component).
#' * `extract_status()` extract the residence status (based on the `S`
#' component)
#'
#' This function returns a date vector:
#'
#' * `extract_dob()` get the date of birth (based on the `S`, `AA`, `LL`, and
#' `ZZ` components).
#'
#' @param x a `cnp` vector.
#'
#' @return
#' * `extract_sex()`: a character vector containing the parsed sex: `M` or `F`.
#' * `extract_birth_year()`: a character vector containing the birth year.
#' * `extract_birth_month()`: a character vector containing the birth month.
#' * `extract_county()`: a character vector containing the county of issue.
#' * `extract_status()`: a character vector containing the residence status
#' (`"native"` or `"resident"`).
#' * `extract_dob()`: a vector of containing the date of birth.
#'
#' @export
#'
#' @examples
#'
#' # Extract sex
#' extract_sex(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
#'
#' # Extract birth year
#' extract_birth_year(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
#'
#' # Extract birth month
#' extract_birth_month(cnp(c(5201206346491, 1940616346114, 7041218318525, NA)))
#'
#' # Extract date of birth
#' extract_dob(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
#'
#' # Extract county
#' extract_county(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
#'
#' # Extract residence status
#' extract_status(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
#'
extract_sex <- function(x) {
  if (!is_cnp(x)) {
    cli::cli_abort(
      "{.arg x} must be a {.code cnp} vector. You have supplied a \\
      {.obj_type_friendly x}."
    )
  }

  vctrs::field(x, "sex")
}

#' @export
#' @rdname extract_sex
extract_birth_year <- function(x) {
  if (!is_cnp(x)) {
    cli::cli_abort(
      "{.arg x} must be a {.code cnp} vector. You have supplied a \\
      {.obj_type_friendly x}."
    )
  }

  vctrs::field(x, "yob")
}

#' @export
#' @rdname extract_sex
extract_birth_month <- function(x) {
  if (!is_cnp(x)) {
    cli::cli_abort(
      "{.arg x} must be a {.code cnp} vector. You have supplied a \\
      {.obj_type_friendly x}."
    )
  }

  vctrs::field(x, "ll")
}

#' @export
#' @rdname extract_sex
extract_dob <- function(x) {
  if (!is_cnp(x)) {
    cli::cli_abort(
      "{.arg x} must be a {.code cnp} vector. You have supplied a \\
      {.obj_type_friendly x}."
    )
  }

  vctrs::field(x, "dob")
}

#' @export
#' @rdname extract_sex
extract_county <- function(x) {
  if (!is_cnp(x)) {
    cli::cli_abort(
      "{.arg x} must be a {.code cnp} vector. You have supplied a \\
      {.obj_type_friendly x}."
    )
  }

  vctrs::field(x, "county")
}

#' @export
#' @rdname extract_sex
extract_status <- function(x) {
  if (!is_cnp(x)) {
    cli::cli_abort(
      "{.arg x} must be a {.code cnp} vector. You have supplied a \\
      {.obj_type_friendly x}."
    )
  }

  vctrs::field(x, "status")
}
