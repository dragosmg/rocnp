#' Extract Residence Status from the Personal Numeric Code
#'
#' @inheritParams get_sex
#'
#' @return a character vector containing the residence status: `"native"` or
#'   `"resident"`.
#' @export
#'
#' @examples
#' get_status(6201206018078)
#' get_status(5201206346491)
#' get_status(1940616346114)
#' get_status(1940616346114, lang = "EN")
#' get_status(7041218318525)
#' get_status(7041218318525, lang = "EN")
get_status <- function(cnp) {
  vctrs::field(cnp, "status")
}
