get_cnp_checksum <- function(cnp) {
    dec_cnp <- stringr::str_extract_all(as.character(cnp), "[0-9]") %>%
        unlist()

    mult_cnp <- as.integer(dec_cnp[1:12]) *
        c(2, 7, 9, 1, 4, 6, 3, 5, 8, 2, 7, 9)

    remainder <- sum(mult_cnp) %% 11

    if (remainder == 10) {
        11 - remainder
    } else {
        remainder
    }
}
