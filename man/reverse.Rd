\name{reverse}
\alias{reverse}
\title{Item Reversing}
\description{
Reverse the response of an item, inverting the minimum with the maximum.
}
\usage{
reverse(x, x.min = min(x), x.max = max(x))
}
\arguments{
    \item{x}{Numerical vector of responses.}
    \item{x.min}{Theoretical minimum of \code{x}.}
    \item{x.max}{Theoretical maximum of \code{x}.}
}
\details{
The function allows to reverse the scores of a vector.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\examples{
x <- 1:4
reverse(x)
reverse(x,1,5)
}
