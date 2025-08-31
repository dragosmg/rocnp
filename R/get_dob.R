#' Extract the Date of Birth from the Personal Numeric Code
#'
#' Extract the date of birth based on the relevant CNP components.
#'
#' @param cnp (`cnp`) a `cnp` vector.
#'
#' @return a vector of dates.
#' @export
#'
#' @examples
#' get_dob(cnp("1940616346114"))
#' get_dob(cnp("7041218318525"))
#' get_dob(cnp("6201206018078"))
#' get_dob(cnp("5201206346491"))
#' get_dob(cnp(c("5201206346491", "1940616346114", "7041218318525")))
#' get_dob(cnp(c("5201206346491", "1940616346114", "7041218318525", NA)))
get_dob <- function(cnp) {
  vctrs::field(cnp, "dob")
}
