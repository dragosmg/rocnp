#' Extract Sex from the Personal Numeric Code
#'
#' Extract the sex based on the `S` component of the CNP.
#'
#' @param cnp (`cnp`) a `cnp` vector.
#'
#' @return a character vector of the parsed sex: `M` or `F`.
#' @export
#'
#' @examples
#' get_sex(cnp("1940616346114"))
#' get_sex(cnp("7041218318525"))
#' get_sex(cnp("6201206018078"))
#' get_sex(cnp("5201206346491"))
#' get_sex(cnp(c("5201206346491", "1940616346114", "7041218318525")))
#' get_sex(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
get_sex <- function(cnp) {
  vctrs::field(cnp, "sex")
}
