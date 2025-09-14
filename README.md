
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rocnp

<!-- badges: start -->

[![R-CMD-check](https://github.com/dragosmg/rocnp/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dragosmg/rocnp/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/dragosmg/rocnp/graph/badge.svg)](https://app.codecov.io/gh/dragosmg/rocnp)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/rocnp)](https://CRAN.R-project.org/package=rocnp)
<!-- badges: end -->

The goal of {rocnp} is to provide a set of functions for working with
Romanian Personal Numeric Codes / Coduri Numerice Personale (CNP).

## Features

rocnp includes the following functionality for working with Romanian
personal numeric codes (PNC / CNP):

- an S3 class called `cnp`:
  - implemented as a record (similar to `POSIXlt`) with
    `vctrs::new_rcrd()`. The implementation details are
- a constructor, `cnp()` for creating a `cnp` object
- the constructor automatically decomposes the CNP and augments it by
  parsing the various field
- access the various components with the `extract_()` family of
  functions:
  - use `extract_sex()` for sex.
  - `extract_birth_year()` for the year of birth.
  - `extract_birth_month()` for the month of birth.
  - `extract_county()` for county of issue.
  - `extract_status()` for the residence status.
  - `extract_dob()` for the date of birth.

## Installation

You can install the released version of {rocnp} from
[CRAN](https://CRAN.R-project.org):

``` r
install.packages("rocnp")
```

Alternatively, if you need the development version from
[GitHub](https://github.com/dragosmg/rocnp), install it with

``` r
# install.packages("pak")
pak::pkg_install("dragosmg/rocnp")
```

## Usage

This is an example which shows you how to use some of the functions in
rocnp:

``` r
library(rocnp)

# these are synthetically generated CNPs
# check CNP is valid
cnps <- cnp(
  c(
    "1940616346114", "6201206018078", "1940616346114"
  )
)

extract_sex(cnps)
#> [1] "M" "F" "M"
extract_birth_year(cnps)
#> [1] "1994" "2020" "1994"
extract_birth_month(cnps)
#> [1] "06" "12" "06"
extract_dob(cnps)
#> [1] "1994-06-16" "2020-12-06" "1994-06-16"
extract_county(cnps)
#> [1] "Teleorman" "Alba"      "Teleorman"
extract_status(cnps)
#> [1] "native" "native" "native"
```
