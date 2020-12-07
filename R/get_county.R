get_county <- function(county_code) {
    county_lookup_file <- system.file("extdata", "county_lookup.csv",
                                      package = "rocnp")

    county_lut <- readr::read_csv(county_lookup_file,
                                  col_types = readr::cols(
                                      code = readr::col_character(),
                                      county = readr::col_character()
                                  ))

    county_lut %>%
        dplyr::filter(.data$code == county_code) %>%
        dplyr::pull(.data$county)
}
