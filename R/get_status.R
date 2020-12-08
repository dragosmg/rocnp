get_status <- function(cnp_dec) {

    if (cnp_dec["S"] %in% as.character(1:6)) {
        status <- "native"
    }

    if (cnp_dec["S"] %in% as.character(7:8)) {
        status <- "resident"
    }

    status
}
