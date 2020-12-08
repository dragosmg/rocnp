get_birth_month <- function(cnp_dec, lang = c("RO", "EN")) {
    lang <- match.arg(lang)

    # define a vector of month names in Romanian
    month_name_ro <- c("Ianuarie", "Februarie", "Martie", "Aprilie", "Mai",
                       "Iunie", "Iulie", "August", "Septembrie", "Octombrie",
                       "Noiembrie", "Decembrie")

    if (lang == "RO") {
        month <- month_name_ro[as.numeric(cnp_dec["LL"])]
    } else {
        month <- month.name[as.numeric(cnp_dec["LL"])]
    }

    month
}
