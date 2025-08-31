#' Parse the CNP fields
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
augment_cnp <- function(x) {
  output <- x |>
    parse_sex() |>
    parse_yob() |>
    parse_dob() |>
    parse_county() |>
    parse_status()

  output
}

parse_sex <- function(x) {
  sex_field <- x[["s"]]

  sex <- dplyr::case_when(
    sex_field %in% c("1", "3", "5", "7") ~ "M",
    sex_field %in% c("2", "4", "6", "8") ~ "F"
  )

  x[["sex"]] <- sex

  x
}

parse_yob <- function(x) {
  current_year <- lubridate::today() |>
    lubridate::year() - 2000

  yob_df <- tibble::tibble(
    sex = x[["s"]],
    year = x[["aa"]],
    month = x[["ll"]],
    day = x[["zz"]]
  ) |>
    dplyr::mutate(
      century_digits = dplyr::case_when(
        sex %in% c("1", "2") ~ "19",
        sex %in% c("3", "4") ~ "18",
        sex %in% c("5", "6") ~ "20",
        sex %in% c("7", "8") & as.integer(year) <= current_year ~ "20",
        sex %in% c("7", "8") & as.integer(year) >= current_year ~ "19",
        .default = NA_character_
      )
    ) |>
    dplyr::mutate(
      birth_year = stringr::str_c(century_digits, year)
    )

  x[["yob"]] <- dplyr::pull(yob_df, birth_year)

  x
}

parse_dob <- function(x) {
  dob_df <- tibble::tibble(
    yob = x[["yob"]],
    month = x[["ll"]],
    day = x[["zz"]]
  ) |>
    dplyr::mutate(
      dob = glue::glue("{yob}-{month}-{day}"),
      dob = lubridate::ymd(dob, quiet = TRUE)
    )

  x[["dob"]] <- dplyr::pull(dob_df, dob)

  x
}

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

  x[["county"]] <- dplyr::pull(county_df, county)

  x
}

parse_status <- function(x) {
  sex_field <- x[["s"]]

  status <- dplyr::case_when(
    sex_field %in% c("1", "2", "3", "4", "5", "6") ~ "native",
    sex_field %in% c("7", "8") ~ "resident"
  )

  x[["status"]] <- status

  x
}
