#' @keywords internal
#' @importFrom rlang .data
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1")  {
    utils::globalVariables(c(".", "sex", "status", "birth_month",
                             "birth_year", "county", "cnp_dec"))
}
