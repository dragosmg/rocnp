## code to prepare `days_in_month` dataset goes here

days_in_month <- tibble::tibble(
  month = as.character(1:12),
  days_non_leap = c(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),
  days_leap = c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
) |>
  dplyr::mutate(
    month = stringr::str_pad(
      month,
      width = 2,
      side = "left",
      pad = "0"
    )
  )

usethis::use_data(days_in_month, overwrite = TRUE)
