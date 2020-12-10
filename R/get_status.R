get_status <- function(cnp_dec, lang = c("RO", "EN")) {

    lang <- match.arg(lang)

    if (cnp_dec["S"] %in% as.character(1:6)) {
        status_en <- "born in Romania"
        status_ro <- "nascut in Romania"
    }

    if (cnp_dec["S"] %in% as.character(7:8)) {
        status_en <- "resident"
        status_ro <- "rezident"
    }

    if (lang == "RO") {
        return(status_ro)
    } else {
        return(status_en)
    }
}
