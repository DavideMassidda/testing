\name{prank}
\alias{prank}
\title{Percentile Rank}
\description{
Calculate the percentile rank corresponding to a breakpoint.
}
\usage{
prank(x, breaks, perc = TRUE, digits = 1, names = TRUE)
}
\arguments{
    \item{x}{Numerical vector of observed data.}
    \item{breaks}{Cut-off values to use as breakpoints.}
    \item{perc}{Logical. Convert the result in percentages.}
    \item{digits}{Number of decimals for output.}
    \item{names}{
        Logical. If \code{TRUE}, the cut-off values are used as names of elements in output.}
}
\details{
For each breakpoint, the function returns the percentage of data less than or equal
to the break value.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\examples{
data("drive")
score <- rowSums(drive[,5:10])
prank(score, seq(5,25,by=5))
}
