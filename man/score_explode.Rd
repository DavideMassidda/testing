\name{score_explode}
\alias{score_explode}
\title{Score explosion}
\description{
Converts a sequence of classified scores into a numeric sequence, by exploding the values
included in the intervals.
}
\usage{
score_explode(x, sep = "-", out.names = names(x))
}
\arguments{
    \item{x}{Numeric vector.}
    \item{sep}{Symbol used to separate the extremes of an interval.}
    \item{out.names}{Names for the elements in the output vector (use \code{NULL} to exclude names).}
}
\details{
For each interval of scores, the resulting vector will contain all the numbers included within
te extremes (see the examples for details).
Pay attention that the length of the output vector can be different to the length of the input
vector.
}
\seealso{
\code{\link[testing]{score_implode}}, \code{\link[testing]{score_rollup}}
}
\examples{
# Example of interval explosion:
score_explode("1-3")
score_explode("3-1")
# Examples of explosion of scores:
x <- c("19","17-18","","16","15","","14","11-13","10",
       "9","8","","","7","6","5","4","","3","1-2")
       cbind(x)
score_explode(x)
x <- c("18-20","21-24","25","26-28")
cbind(x)
score_explode(x)
x <- rev(x)
cbind(x)
score_explode(x)
}
