#' Parse the CNP fields
#'
#' Augment the CNPs by parsing and adding the following components:
#'   * `sex`: processed with `parse_sex()`
#'   * `yob`: year of birth, `parse_yob()`
#'   * `dob`: date of birth, `parse_dob()`
#'   * `county`: county of birth, `parse_county()`
#'   * `status`: status, indicating `resident` or `native` `parse_status()`
#'
#' @param x (list) a decomposed CNP.
#'
#' @return th input list with a series of additional fields:
#'   * `sex`: the parsed sex
#'   * `dob`: the reconstructed date of birth
#'
#' @keywords internal
#'
#' @examples
#' rocnp:::decompose_cnp(c("1940616346114", "7041218318525")) |>
#'   rocnp:::augment_cnp()
augment_cnp <- function(x) {
  output <- x |>
    parse_sex() |>
    parse_yob() |>
    parse_dob() |>
    parse_county() |>
    parse_status()

  output
}

#' @rdname augment_cnp
parse_sex <- function(x) {
  # nolint start: object_usage_linter
  sex_field <- x[["s"]]
  # nolint end

  sex <- dplyr::case_when(
    sex_field %in% c("1", "3", "5", "7") ~ "M",
    sex_field %in% c("2", "4", "6", "8") ~ "F"
  )

  x[["sex"]] <- sex

  x
}

#' @rdname augment_cnp
parse_yob <- function(x) {
  # nolint start: object_usage_linter
  cur_year <- lubridate::today() |>
    lubridate::year() - 2000L
  # nolint end

  yob_df <- tibble::tibble(
    sex = x[["s"]],
    year = x[["aa"]],
    month = x[["ll"]],
    day = x[["zz"]]
  ) |>
    dplyr::mutate(
      century_digits = dplyr::case_when(
        .data$sex %in% c("1", "2") ~ "19",
        .data$sex %in% c("3", "4") ~ "18",
        .data$sex %in% c("5", "6") ~ "20",
        .data$sex %in% c("7", "8") & as.integer(.data$year) <= cur_year ~ "20",
        .data$sex %in% c("7", "8") & as.integer(.data$year) >= cur_year ~ "19",
        .default = NA_character_
      ),
      birth_year = stringr::str_c(
        .data$century_digits,
        .data$year
      )
    )

  x[["yob"]] <- dplyr::pull(yob_df, .data$birth_year)

  x
}

#' @rdname augment_cnp
parse_dob <- function(x) {
  dob_df <- tibble::tibble(
    yob = x[["yob"]],
    month = x[["ll"]],
    day = x[["zz"]]
  ) |>
    dplyr::mutate(
      dob = glue::glue("{yob}-{month}-{day}"),
      dob = lubridate::ymd(.data$dob, quiet = TRUE)
    )

  x[["dob"]] <- dplyr::pull(dob_df, .data$dob)

  x
}

#' @rdname augment_cnp
parse_county <- function(x) {

  county_df <- tibble::tibble(
    code = x[["jj"]]
  ) |>
    dplyr::left_join(
      county_lookup,
      by = dplyr::join_by(
        "code" == "code"
      )
    )

  x[["county"]] <- dplyr::pull(county_df, .data$county)

  x
}

#' @rdname augment_cnp
parse_status <- function(x) {
  # nolint start: object_usage_linter
  sex_field <- x[["s"]]
  # nolint end

  status <- dplyr::case_when(
    sex_field %in% c("1", "2", "3", "4", "5", "6") ~ "native",
    sex_field %in% c("7", "8") ~ "resident"
  )

  x[["status"]] <- status

  x
}
