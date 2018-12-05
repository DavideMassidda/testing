\name{reverse}
\alias{reverse}
\title{Score reversing}
\description{
Reverse the response of a score, inverting the minimum with the maximum.
}
\usage{
reverse(x, x.min = min(x), x.max = max(x))
}
\arguments{
    \item{x}{Numerical vector of scores.}
    \item{x.min}{Theoretical minimum of \code{x}.}
    \item{x.max}{Theoretical maximum of \code{x}.}
}
\details{
The function allows to reverse the responses to an item.
}
\examples{
x <- 1:4
reverse(x)
reverse(x,1,5)
}
