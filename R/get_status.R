#' Extract Residence Status from the Personal Numeric Code
#'
#' @inheritParams get_sex
#'
#' @return a character vector containing the residence status: `"native"` or
#'   `"resident"`.
#' @export
#'
#' @examples
#' get_status(cnp("6201206018078"))
#' get_status(cnp(c("5201206346491", "1940616346114")))
get_status <- function(cnp) {
  vctrs::field(cnp, "status")
}
