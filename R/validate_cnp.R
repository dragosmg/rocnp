validate_cnp <- function(x, call = rlang::caller_env()) {
# browser()
  validate_nchar(x, call = call)

  decomposed_cnp <- decompose_cnp(x)

  validate_sex(decomposed_cnp, call = call)
  validate_month(decomposed_cnp, call = call)
  validate_day(decomposed_cnp, call = call)
}

validate_nchar <- function(x, call = rlang::caller_env()) {
  if (any(nchar(x) != 13, na.rm = TRUE)) {
    cli::cli_abort(
      "Each element of {.arg x} must have exactly 13 characters.",
      call = rlang::caller_env()
    )
  }

  invisible(x)
}

# validate the `s` component representing sex
validate_sex <- function(x, call = rlang::caller_env()) {

  valid_sex_characters <- c(as.character(1:8), NA)

  if (any(!x[["s"]] %in% valid_sex_characters)) {
    cli::cli_abort(
      "The sex field -{.field s}- must be between 1 and 8.",
      call = call
    )
  }

  invisible(x)
}

# validate the `ll` component representing the month
validate_month <- function(x, call = rlang::caller_env()) {
  valid_months <- stringr::str_pad(
    as.character(1:12),
    width = 2,
    side = "left",
    pad = "0"
  ) |>
    c(NA)

  if (any(!(x[["ll"]] %in% valid_months))) {
    cli::cli_abort(
      "The months field -{.field ll}- must be between '01' and '12'.",
      call = call
    )
  }

  invisible(x)
}

# validate the `zz` component representing the day of the month
validate_day <- function(x, call = rlang::caller_env()) {

  cnp_month_df <- tibble::tibble(
    cnp_month = x[["ll"]],
    cnp_day = x[["zz"]]
  )

  max_days_in_month <- tibble::tibble(
    month = as.character(1:12),
    max_days = c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
  ) |>
    dplyr::mutate(
      month = stringr::str_pad(
        month,
        width = 2,
        side = "left",
        pad = "0"
      )
    )

  valid_day <- cnp_month_df |>
    dplyr::left_join(
      max_days_in_month,
      by = dplyr::join_by(
        cnp_month == month
      )
    ) |>
    dplyr::mutate(
      valid = cnp_day <= max_days
    ) |>
    dplyr::pull(valid)

  if (!all(valid_day, na.rm = TRUE)) {
    cli::cli_abort(
      "The day field -{.field zz} exceedes the maximum number of days for at \\
      least one CNP.",
      call = call
    )
  }

  invisible(x)
}
