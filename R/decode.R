# decode the sex
decode_sex <- function(cnp) {

  sex_field <- vctrs::field(cnp, "s")

  output <- dplyr::case_when(
    sex_field %in% c("1", "3", "5", "7") ~ "M",
    sex_field %in% c("2", "4", "6", "8") ~ "F"
  )

  output
}

# decode date of birth
decode_dob <- function(cnp) {

  dob_df <- tibble::tibble(
    sex = vctrs::field(cnp, "s"),
    year = vctrs::field(cnp, "aa"),
    month = vctrs::field(cnp, "ll"),
    day = vctrs::field(cnp, "zz")
  ) |>
    dplyr::mutate(
      century_digits = dplyr::case_when(
        sex %in% c("1", "2") ~ "19",
        sex %in% c("3", "4") ~ "18",
        sex %in% c("5", "6") ~ "20",
        sex %in% c("7", "8") ~ "",
        .default = NA_character_
      )
    ) |>
    dplyr::mutate(
      birth_year = stringr::str_c(century_digits, year),
      dob = glue::glue("{birth_year}-{month}-{day}"),
      dob = lubridate::ymd(dob)
    )

  dplyr::pull(dob_df, dob)
}
