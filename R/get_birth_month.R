#' Extract the Month of Birth from the Personal Numeric Code
#'
#' This function extracts the month of birth starting from the `"LL"` component.
#'
#' @inheritParams get_sex
#'
#' @return a numeric vector representing the month of birth
#' @export
#'
#' @examples
#' get_birth_month(cnp(1940616346114))
#' get_birth_month(cnp(7041218318525))
#' cnps <- cnp(c(5201206346491, 1940616346114, 7041218318525, 6201206018078))
#' get_birth_month(cnps)
#' get_birth_month(cnp(c(5201206346491, 1940616346114, 7041218318525, NA)))
get_birth_month <- function(cnp) {
  vctrs::field(cnp, "ll")
}
