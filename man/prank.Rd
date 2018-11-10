\name{prank}
\alias{prank}
\title{Percentile Rank}
\description{
Calculate the percentile rank corresponding to a breakpoint.
}
\usage{
prank(x, breaks, fun = "<=", perc = TRUE, digits = 1,
    out.names = as.character(breaks))
}
\arguments{
    \item{x}{Numerical vector of observed data.}
    \item{breaks}{Cut-off values to use as breakpoints.}
    \item{fun}{Comparison function used to count the data.}
    \item{perc}{Logical. Convert the result in percentages.}
    \item{digits}{Number of decimals for output.}
    \item{out.names}{Names for the elements in the output vector (use \code{NULL} to exclude names).}
}
\details{
For each breakpoint, if \code{fun = "<="}, the function returns the percentage of data less than or equal
to the break value. Otherwise, if \code{fun = ">="}, the function returns the percentage of data greater
than or equal to the break value.
}
\examples{
data("drive")
score <- rowSums(drive[,5:10])
prank(score, seq(5,25,by=5))
}
