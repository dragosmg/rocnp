#' County lookup table
#'
#' A lookup table mapping the county code to the county name.
#'
#' @format ## `county_lookup`
#' A data frame with 48 rows and 2 columns:
#' \describe{
#'   \item{code}{county code}
#'   \item{county}{county name}
#' }
#' @source <https://ro.wikipedia.org/wiki/Cod_numeric_personal_(România)#JJ>
"county_lookup"

#' Days in month lookup table
#'
#' A lookup table containing the number of days in a month.
#'
#' @format ## `days_in_month`
#' A data frame with 12 rows and 3 columns:
#' \describe{
#'   \item{month}{month as padded character - `"01"` to `"12"`}
#'   \item{days_non_leap}{number of days in a non-leap year}
#'   \item{days_leap}{number of days in a leap year}
#' }
"days_in_month"
