get_gender <- function(cnp_dec, lang = c("RO", "EN")) {

    lang <- match.arg(lang)

    if (cnp_dec["S"] %in% as.character(c(1, 3, 5, 7))) {
        gender_en <- "man"
        gender_ro <- "masculin"
    }

    if (cnp_dec["S"] %in% as.character(c(2, 4, 6, 8))) {
        gender_en <- "woman"
        gender_ro <- "feminin"
    }

    if (lang == "RO") return(gender_ro)
    if (lang == "EN") return(gender_en)
}
