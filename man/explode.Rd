\name{explode}
\alias{explode}
\title{Score Explosion}
\description{
Converts a sequence of classified scores into a numeric sequence, by exploding the values
included in the intervals.
}
\usage{
explode(x, direction = c("forward", "backward"), sep = "-")
}
\arguments{
    \item{x}{Numeric vector.}
    \item{direction}{Specify if the scores are classified in ascending (\code{forward})
        or descending (\code{backward}) order. Default is (\code{forward}).}
    \item{sep}{Symbol used to separate the extremes of an interval.}
}
\details{
For each interval of scores, the resulting vector will contain all the numbers included within
te extremes (see the examples for details).
Pay attention that the length of the output vector can be different to the length of the input
vector.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{implode}, \code{\link[testing]{rollup}}
}
\examples{
# Example of interval explosion:
explode("1-3", direction="forward")
explode("1-3", direction="backward")
# Example of explosion of scores:
x <- c("19","17-18","","16","15","","14","11-13","10",
       "9","8","","","7","6","5","4","","3","1-2")
explode(x, direction="backward")
}
