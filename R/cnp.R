# developer-facing constructor for the `cnp` S3 class
new_cnp <- function(x = character())  {

  if (!is.character(x)) {
    cli::cli_abort(
      "{.arg x} must be a character. You have supplied a \\
      {.obj_type_friendly x}.",
      call = rlang::caller_env()
    )
  }

  decomposed_cnp <- decompose_cnp(x)

  augmented_cnp <- augment_cnp(decomposed_cnp)

  vctrs::new_rcrd(
    augmented_cnp,
    class = "cnp"
  )

}

#' Create a `cnp` object
#'
#' @description
#' * `cnp()` is used to build a `cnp` vector
#' * `is_cnp` is used to check whether a vector is of class `cnp`
#'
#' @param x (character) a character (or values that can be cast to character)
#'   vector of personal numeric codes (CNPs).
#'
#' @return
#' * `cnp()`: a vector of class `cnp`.
#' * `is_cnp()`: a logical vector.
#'
#' @export
#'
#' @examples
#' a <- cnp(c("1940616346114", "7041218318525"))
#'
#' is_cnp(a)
#'
#' is_cnp(1L:3L)
cnp <- function(x = character()) {

  x <- as.character(x)

  if (any(nchar(x) != 13L, na.rm = TRUE)) {
    cli::cli_abort(
      "Each element of {.arg x} must have exactly 13 characters."
    )
  }

  validate_cnp(new_cnp(x))
}

#' @export
format.cnp <- function(x, ...) {
  vctrs::field(x, "cnp")
}

#' @export
#' @rdname cnp
is_cnp <- function(x) {
  inherits(x, "cnp")
}
