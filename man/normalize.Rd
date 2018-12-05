\name{normalize}
\alias{normalize}
\alias{normalise}
\title{Vector rescaling}
\description{
Rescale a vector within a new range.
}
\usage{
normalize(x, new.min, new.max, x.min = min(x), x.max = max(x))
normalise(x, new.min, new.max, x.min = min(x), x.max = max(x))
}
\arguments{
    \item{x}{Numeric vector or single value.}
    \item{new.min}{New minimum.}
    \item{new.max}{New maximum.}
    \item{x.min}{Current minimum.}
    \item{x.max}{Current maximum.}
}
\details{
The function rescale the data by using the formula:
\deqn{ a + (b - a) * (x - min(x))/(max(x) - min(x)) }
where \eqn{a} is the new minimum of \eqn{x} and \eqn{b} the new maximum.
}
\examples{
x <- 5:15
normalize(x, 0, 10)
normalize(x, -5, 5)
}
