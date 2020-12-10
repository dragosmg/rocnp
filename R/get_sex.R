get_sex <- function(cnp, lang = c("RO", "EN")) {

    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

    if (cnp_dec["S"] %in% as.character(c(1, 3, 5, 7))) {
        sex_en <- "masculine"
        sex_ro <- "masculin"
    }

    if (cnp_dec["S"] %in% as.character(c(2, 4, 6, 8))) {
        sex_en <- "feminine"
        sex_ro <- "feminin"
    }

    if (lang == "RO") {
        return(sex_ro)
    } else {
        return(sex_en)
    }
}
