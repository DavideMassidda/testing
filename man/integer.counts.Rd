\name{integer.counts}
\alias{integer.counts}
\alias{likert.counts}
\title{Count integer values}
\description{
Giver a vector of integer values, the function counts the number of data for each integer value
included within the span of values.
}
\usage{
integer.counts(x, x.min = min(x), x.max = max(x), perc = FALSE, na.keep = TRUE)
}
\arguments{
    \item{x}{Numeric vector of integers.}
    \item{x.min}{Minimum observable value.}
    \item{x.max}{Maximum observable value.}
    \item{perc}{Logical value which specifies if convert the counts in percentages.}
    \item{na.keep}{Logical value which specifies if consider missing data
        when converting counts in percentages (see details).}
}
\details{
The function is similar to \code{table}, but: 1) it returns a vector; 2) it returns the
counts for all values included in the range, considering also the values
which not compare in the input vector; 3) it can convert directly counts in
percentages (\code{perc=T}).

When \code{perc=T}, if \code{na.keep=T}, in the calculus of percentages missing data
will be counted. For this reason, if missing data are present in the vector of responses,
the resulting sum of percentages will be lower to 100. The percentages will be calculated
dividing the counts for n-q, where q is the number of missing data.
}
\value{
A \code{vector} containing the frequencies.
}
\seealso{
\code{\link[base]{table}}
}
\examples{
# Example with 0-frequency
x <- c(5,2,1,2,5,2,4,5,4,4,2,1,2,1,4,4,4,1,2,4)
table(x)
integer.counts(x,1,5)
# Example with NA's
x <- c(5,4,2,5,4,2,1,NA,4,3,4,1,5,3,NA,3,3,2,4,3)
integer.counts(x,1,5)
integer.counts(x,1,5, perc=TRUE)
prop.table(table(x, useNA="always"))*100
integer.counts(x,1,5, perc=TRUE, na.keep=FALSE)
prop.table(table(x))*100
}
