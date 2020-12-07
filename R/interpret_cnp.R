interpret_cnp <- function(cnp, lang = c("RO", "EN")) {
    cnp_dec <- decompose_cnp(cnp)

    lang <- match.arg(lang)

    # build the gender
    if (cnp_dec['S'] %in% c(1, 3, 5, 7)) {
        gender_en <- "man"
        gender_ro <- "masculin"
    }

    if (cnp_dec['S'] %in% c(2, 4, 6, 8)) {
        gender_en <- "woman"
        gender_ro <- "feminin"
    }

    # build the year based on the gender encoding
    if (cnp_dec['S'] %in% c(1, 2)) {
        yob <- str_c(19, cnp_dec["AA"]) %>% as.integer()
    }

    if (cnp_dec['S'] %in% c(3, 4)) {
        yob <- str_c(18, cnp_dec["AA"]) %>% as.integer()
    }

    if (cnp_dec['S'] %in% c(5, 6)) {
        yob <- str_c(20, cnp_dec["AA"])  %>% as.integer()
    }

    if (cnp_dec['S'] %in% c(7, 8)) {
        yob <- str_c("__", cnp_dec["AA"]) %>% as.integer()
    }

    county <- cnp_dec['JJ'] %>%
        as.character() %>%
        get_county()

    if (lang == "RO" && cnp_dec['S'] %in% 1:6) {
        result <- glue::glue("Acest CNP apartine unei persoane de sex //
                             {gender_ro}, nascuta pe data de {cnp_dec['ZZ']} //
                             {month_name_ro[cnp_dec['LL']]} {yob} in judetul //
                             {county}")
    }



}

month_name_ro <- c("Ianuarie", "Februarie", "Martie", "Aprilie", "Mai",
                   "Iunie", "Iulie", "August", "Septembrie", "Octombrie",
                   "Noiembrie", "Decembrie")

