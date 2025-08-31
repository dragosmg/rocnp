validate_cnp <- function(x, call = rlang::caller_env()) {

  validate_nchar(x, call = call)
  validate_sex(x, call = call)
  validate_month(x, call = call)
  validate_day(x, call = call)

  x
}

validate_nchar <- function(x, call = rlang::caller_env()) {

  cnp <- vctrs::field(x, "cnp")

  if (any(nchar(cnp) != 13, na.rm = TRUE)) {
    cli::cli_abort(
      "Each element of {.arg x} must have exactly 13 characters.",
      call = rlang::caller_env()
    )
  }

  invisible(x)
}

# validate the `s` component representing sex
validate_sex <- function(x, call = rlang::caller_env()) {

  sex <- vctrs::field(x, "s")

  valid_sex_digits <- c(as.character(1:8), NA)

  if (any(!sex %in% valid_sex_digits)) {
    cli::cli_abort(
      "The sex at birth field -{.field s}- must be between 1 and 8.",
      call = call
    )
  }

  invisible(x)
}

# validate the `ll` component representing the month
validate_month <- function(x, call = rlang::caller_env()) {

  cnp_month <- vctrs::field(x, "ll")

  valid_months <- stringr::str_pad(
    as.character(1:12),
    width = 2,
    side = "left",
    pad = "0"
  ) |>
    c(NA)

  if (any(!(cnp_month %in% valid_months))) {
    cli::cli_abort(
      "The month of birth field -{.field ll}- must be between '01' and '12'.",
      call = call
    )
  }

  invisible(x)
}

# validate the `zz` component representing the day of the month
validate_day <- function(x, call = rlang::caller_env()) {
  cnp_month_df <- tibble::tibble(
    year = vctrs::field(x, "yob"),
    month = vctrs::field(x, "ll"),
    day = vctrs::field(x, "zz")
  ) |>
    dplyr::left_join(
      days_in_month,
      by = dplyr::join_by(
        "month" == "month"
      )
    ) |>
    dplyr::mutate(
      leap_year = lubridate::leap_year(
        as.integer(
          .data$year
        )
      ),
      max_dd = dplyr::if_else(
        .data$leap_year,
        .data$days_leap,
        .data$days_non_leap
      ),
      valid = .data$day <= .data$max_dd
    )

  valid_day <- cnp_month_df |>
    dplyr::pull(.data$valid)

  if (!all(valid_day, na.rm = TRUE)) {
    cli::cli_abort(
      "The day of birth field -{.field zz}- cannot exceed the number of days \\
      in that calendar month.",
      call = call
    )
  }

  invisible(x)
}

validate_checksum <- function(x, call = rlang::caller_env()) {

  checksum_df <- tibble::tibble(
    cnp_init = x,
    cnp = vctrs::field(x, "cnp")
  ) |>
    dplyr::mutate(
      cnp_digits = stringr::str_extract_all(cnp, "[0-9]"),
      cnp_digits = purrr::map(cnp_digits, as.integer),
      first_12_digits = purrr::map(cnp_digits, ~ .x[1:12]),
      last_digit = purrr::map(cnp_digits, ~.x[13]),
      last_digit = as.integer(last_digit),
      checksum = purrr::map(first_12_digits, calculate_checksum),
      checksum = as.integer(checksum),
      valid = checksum == last_digit
    ) |>
    dplyr::select(
      cnp_init,
      valid
    )

  if (any(!checksum_df$valid, na.rm = TRUE)) {
    cli::cli_abort(
      "At least one value failed the checksum test.",
      call = call
    )
  }
}

calculate_checksum <- function(x, call = rlang::caller_env()) {

  if (any(is.na(x))) {
    return(NA)
  }

  if (any(length(x) != 12, na.rm = TRUE)) {
    cli::cli_abort(
      "{.arg x} must be made up of 12 digits",
      call = call
    )
  }

  remainder <- sum(x * c(2, 7, 9, 1, 4, 6, 3, 5, 8, 2, 7, 9)) %% 11

  checksum <- dplyr::if_else(
    remainder == 10,
    1,
    remainder
  )

  checksum
}
