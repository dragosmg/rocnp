#' Extract the Sex from the Personal Numeric Code
#'
#' This function extracts the sex based on the `S` component of the CNP.
#' Romanian authorities define sex as binary. In the event of a sex change a
#' new CNP could be issued.
#'
#' @param cnp (`cnp`) a `cnp` vector.
#'
#' @return a character vector of the recorded sex: `M` or `F`.
#' @export
#'
#' @examples
#' get_sex(1940616346114)
#' get_sex(7041218318525)
#' get_sex(6201206018078)
#' get_sex(5201206346491)
#' get_sex(c(5201206346491, 1940616346114, 7041218318525, 6201206018078))
#' get_sex(c(5201206346491, 1940616346114, 7041218318525, NA))
get_sex <- function(cnp) {

  vctrs::field(cnp, "sex")
}
