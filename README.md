
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rocnp

<!-- badges: start -->

[![R-CMD-check](https://github.com/dragosmg/rocnp/workflows/R-CMD-check/badge.svg)](https://github.com/dragosmg/rocnp/actions)
[![Codecov test
coverage](https://codecov.io/gh/dragosmg/rocnp/branch/main/graph/badge.svg)](https://app.codecov.io/gh/dragosmg/rocnp?branch=main)
[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://lifecycle.r-lib.org/articles/stages.html#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/rocnp)](https://CRAN.R-project.org/package=rocnp)
<!-- badges: end -->

The goal of {rocnp} is to provide a set of functions for working with
Romanian personal numeric codes.

## Features

rocnp includes the following functionality for working with Romanian
personal numeric codes (PNC / CNP):

-   check validity using `check_cnp_is_valid()`
-   decompose the code in the parts that make it up with
    `decompose_cnp()`
-   extract the various components with the `get_()` family of
    functions:
    -   `get_birth_year()`
    -   `get_birth_month()`
    -   `get_county()`, etc.

## Installation

You can install the released version of {rocnp} from
[CRAN](https://CRAN.R-project.org):

``` r
install.packages("rocnp")
```

Alternatively, if you need the development version from
[GitHub](https://github.com/dragosmg/rocnp), install it with

``` r
# install.packages(devtools)
devtools::install_dev("rocnp")
```

## Usage

This is an example which shows you how to use some of the functions in
rocnp:

``` r
library(rocnp)

# these are synthetically generated CNPs
# check CNP is valid
check_cnp_is_valid(1940616346114)
#> [1] TRUE

# split CNP into components
decompose_cnp(6201206018078)
#>     S    AA    LL    ZZ    JJ   NNN     C 
#>   "6"  "20"  "12"  "06"  "01" "807"   "8"

# extract birth year 
get_birth_year(1940616346114)
#> [1] "1994"

# extract birth month
get_birth_month(1940616346114)
#> [1] 6

# extract county 
get_county(6201206018078)
#> [1] "Alba"
```
