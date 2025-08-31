cnp_cnp <- function(cnp) {
  vctrs::field(cnp, "cnp")
}

cnp_sex <- function(cnp) {
  s_field <- vctrs::field(cnp, "s")

  output <- dplyr::case_when(
    s_field %in% c("1", "3", "5", "7") ~ "M",
    s_field %in% c("2", "4", "6", "8") ~ "F"
  )

  output
}

cnp_s <- cnp_sex

cnp_year <- function(cnp) {

}

cnp_aa <- cnp_year

cnp_month <- function(cnp) {

}

cnp_ll <- cnp_month

cnp_day <- function(cnp) {

}

cnp_zz <- cnp_day

cnp_county <- function(cnp) {

}

cnp_jj <- cnp_county

cnp_nnn <- function(cnp) {

}

cnp_c <- function(cnp) {

}
#'  * `S` - digit 1 encodes sex at birth
#'  * `AA` - digits 2-3 represent the last 2 digits of the year of birth
#'  * `LL` - digits 4-5 represent the month of birth
#'  * `ZZ` - digits 6-7 represent the day of birth
#'  * `JJ` - digits 8-9 represent the county of birth (for native Romanians)
#'  or the county of issue (for residents)
#'  * `NNN`- digits 10-12 number between 001 and 999 used to differentiate
#'  between people born on the same day in the same county
#'  * `C` - digit 13 checksum
