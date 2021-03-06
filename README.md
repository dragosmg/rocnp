
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rocnp

<!-- badges: start -->

[![R build
status](https://github.com/dragosmg/rocnp/workflows/R-CMD-check/badge.svg)](https://github.com/dragosmg/rocnp/actions)
[![Codecov test
coverage](https://codecov.io/gh/dragosmg/rocnp/branch/main/graph/badge.svg)](https://codecov.io/gh/dragosmg/rocnp?branch=main)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of rocnp is to …

## Installation

You can install the released version of rocnp from
[CRAN](https://CRAN.R-project.org) with:

``` r
#install.packages("rocnp")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
#library(rocnp)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

## Things to document

NAs are contagious invalid CNPs will throw an error, forcing you to
confront then early. Easiest to use `check_cnp_is_valid()` first.
