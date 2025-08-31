## code to prepare `county_lookup` dataset goes here

county_lookup <- tibble::tibble(
  code = c(
    "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12",
    "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24",
    "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36",
    "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "51", "52"
  ),
  county = c(
    "Alba", "Arad", "Argeș", "Bacău", "Bihor", "Bistrița-Năsăud", "Botoșani",
    "Brașov", "Brăila", "Buzău", "Caraș-Severin", "Cluj", "Constanța",
    "Covasna", "Dâmbovița", "Dolj", "Galați", "Gorj", "Harghita", "Hunedoara",
    "Ialomița", "Iași", "Ilfov", "Maramureș", "Mehedinți", "Mureș", "Neamț",
    "Olt", "Prahova", "Satu Mare", "Sălaj", "Sibiu", "Suceava", "Teleorman",
    "Timiș", "Tulcea", "Vaslui", "Vâlcea", "Vrancea", "București",
    "București - Sector 1", "București - Sector 2", "București - Sector 3",
    "București - Sector 4", "București - Sector 5", "București - Sector 6",
    "Călărași", "Giurgiu"
  )
)

usethis::use_data(county_lookup, overwrite = TRUE)
