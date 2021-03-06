% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_status.R
\name{get_status}
\alias{get_status}
\title{Extract Residence Status from the Personal Numeric Code}
\usage{
get_status(cnp, lang = c("RO", "EN"))
}
\arguments{
\item{cnp}{a 13-digit number (or a vector of 13-digit numbers) representing
the Personal Numeric Code - CNP}

\item{lang}{a string denoting the language for the status - either \code{RO} for
Romanian (the default) or \code{EN} for English.}
}
\value{
a string denoting residence status in the language of choice
}
\description{
Extract Residence Status from the Personal Numeric Code
}
\examples{
get_status(6201206018078)
get_status(5201206346491)
get_status(1940616346114)
get_status(1940616346114, lang = "EN")
get_status(7041218318525)
get_status(7041218318525, lang = "EN")
}
