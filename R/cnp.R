new_cnp <- function(x = character())  {

  if (!is.character(x)) {
    cli::cli_abort(
      "{.arg x} must be a character. You have supplied a {.obj_type_friendly x}.",
      call = rlang::caller_env()
    )
  }

  decomposed_cnp <- decompose_cnp(x)

  vctrs::new_rcrd(
    decomposed_cnp,
    class = "cnp"
  )
}

cnp <- function(x = character()) {
  x <- as.character(x)

  if (any(nchar(x) != 13)) {
    cli::cli_abort(
      "Each element of {.arg x} must have exactly 13 characters."
    )
  }

  new_cnp(x)
}

#' @export
format.cnp <- function(x, ...) {
  vctrs::field(x, "cnp")
}
