decompose_cnp <- function(cnp) {
    cnp_string <- as.character(cnp)

    S <- stringr::str_sub(cnp_string, start = 1, end = 1) %>%
        as.integer()

    AA <- stringr::str_sub(cnp_string, start = 2, end = 3) %>%
        as.integer()

    LL <- stringr::str_sub(cnp_string, start = 4, end = 5) %>%
        as.integer()

    ZZ <- stringr::str_sub(cnp_string, start = 6, end = 7) %>%
        as.integer()

    JJ <- stringr::str_sub(cnp_string, start = 8, end = 9) %>%
        as.integer()

    NNN <- stringr::str_sub(cnp_string, start = 10, end = 12) %>%
        as.integer()

    C <- stringr::str_sub(cnp_string, start = 13, end = 13) %>%
        as.integer()

    result <- c("S" = S, "AA" = AA , "LL" = LL, "ZZ" = ZZ, "JJ" = JJ,
                 "NNN" = NNN, "C" = C)

    result
}
