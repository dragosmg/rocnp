get_county <- function(county_code) {
    county_lookup_file <- system.file("extdata", "county_lookup.csv",
                                      package = "rocnp")

    county_lut <- readr::read_csv(county_lookup_file,
                                  col_types = cols(
                                      code = col_character(),
                                      county = col_character()
                                  ))

    county_lut %>%
        filter(code == county_code) %>%
        pull(county)
}
