validate_cnp <- function(x, call = rlang::caller_env()) {

  validate_nchar(x, call = call)
  validate_sex(x, call = call)
  validate_month(x, call = call)
  validate_day(x, call = call)

  x
}

validate_nchar <- function(x, call = rlang::caller_env()) {

  cnp <- vctrs::field(x, "cnp")

  if (any(nchar(cnp) != 13L, na.rm = TRUE)) {
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

  valid_sex_digits <- c(as.character(1L:8L), NA)

  if (!all(sex %in% valid_sex_digits)) {
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
    as.character(1L:12L),
    width = 2L,
    side = "left",
    pad = "0"
  ) |>
    c(NA)

  if (!all(cnp_month %in% valid_months)) {
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

  valid_day <- dplyr::pull(cnp_month_df, .data$valid)

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
      cnp_digits = stringr::str_extract_all(.data$cnp, "[0-9]"),
      cnp_digits = purrr::map(.data$cnp_digits, as.integer),
      first_12_digits = purrr::map(.data$cnp_digits, ~ .x[1L:12L]),
      last_digit = purrr::map(.data$cnp_digits, ~.x[13L]),
      last_digit = as.integer(.data$last_digit),
      checksum = purrr::map(.data$first_12_digits, calculate_checksum),
      checksum = as.integer(.data$checksum),
      valid = .data$checksum == .data$last_digit
    ) |>
    dplyr::select(
      "cnp_init",
      "valid"
    )

  if (!all(checksum_df$valid, na.rm = TRUE)) {
    cli::cli_abort(
      "At least one value failed the checksum test.",
      call = call
    )
  }
}

calculate_checksum <- function(x, call = rlang::caller_env()) {

  if (anyNA(x)) {
    return(NA)
  }

  if (any(length(x) != 12L, na.rm = TRUE)) {
    cli::cli_abort(
      "{.arg x} must be made up of 12 digits",
      call = call
    )
  }

  mult_cnp <- x * c(2L, 7L, 9L, 1L, 4L, 6L, 3L, 5L, 8L, 2L, 7L, 9L)

  remainder <- sum(mult_cnp) %% 11L

  checksum <- dplyr::if_else(
    remainder == 10L,
    1L,
    remainder
  )

  checksum
}
