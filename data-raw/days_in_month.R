## code to prepare `days_in_month` dataset goes here

days_in_month <- tibble::tibble(
  month = as.character(1L:12L),
  days_non_leap = c(31L, 28L, 31L, 30L, 31L, 30L, 31L, 31L, 30L, 31L, 30L, 31L),
  days_leap = c(31L, 29L, 31L, 30L, 31L, 30L, 31L, 31L, 30L, 31L, 30L, 31L)
) |>
  dplyr::mutate(
    month = stringr::str_pad(
      month,
      width = 2L,
      side = "left",
      pad = "0"
    )
  )

usethis::use_data(days_in_month, overwrite = TRUE)
