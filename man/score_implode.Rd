\name{score_implode}
\alias{score_implode}
\title{Score implosion}
\description{
Converts a sequence of classified scores into a numeric sequence, by imploding the values
included in the intervals.
}
\usage{
score_implode(x, fn = mean, out.names = names(x))
}
\arguments{
    \item{x}{Numeric vector.}
    \item{fn}{Method to identify the representative value of intervals.
        Default is the mean between extremes.}
    \item{out.names}{Names for the elements in the output vector (use \code{NULL} to exclude names).}
}
\details{
For each interval of scores, the function finds a representative number for the values included
within the extremes (see the examples for details). Customised functions can be used to extract
the representative values for intervals.
}
\seealso{
\code{\link[testing]{score_explode}}, \code{\link[testing]{score_rollup}}
}
\examples{
x <- data.frame(
        class=c("19","17-18","","16","15","","14","11-13","10",
                "9","8","","","7","6","5","4","","3","1-2"),
        stringsAsFactors=FALSE
    )
x$implosion <- score_implode(x$class)
x
}
