\name{rounding}
\alias{integer.round}
\alias{decimal.floor}
\alias{decimal.ceiling}
\alias{integer.floor}
\alias{integer.ceiling}
\title{Rounding of Numbers}
\description{
Round a number to the nearest value.
}
\usage{
integer.round(x, upper5 = TRUE)
decimal.floor(x, digits = 1)
decimal.ceiling(x, digits = 1)
integer.floor(x, base=10)
integer.ceiling(x, base=10)
}
\arguments{
    \item{x}{A numeric vector.}
    \item{upper5}{Logical value which rule the rounding in presence of the decimal .5.}
    \item{digits}{Integer indicating the number of decimal places to consider.}
    \item{base}{
        Integer value to use as step in rounding. The \code{x} values will be rounded to
        the nearest lower/upper \code{base} value.}
}
\details{
\code{integer.round} rounds a decimal number to the nearest integer. When the decimal
is exactly .5, the number is rounded to the upper integer (\code{upper5 = T}).
The opposite behavior is obtained when \code{upper5 = F}.

\code{decimal.floor} and \code{decimal.ceiling} round a decimal number to the nearest
decimal digit, specified by \code{digits}.

\code{integer.floor} and \code{integer.ceiling} round a number to the nearest integer
value specified by \code{base}.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\link[base]{round}}
}
\examples{
x <- c(8.87, 9.26, 10.5, 11.5, 12.5)
integer.round(x)
integer.round(x, upper5=FALSE)
round(x) # round has a different behavior
decimal.floor(x)
decimal.ceiling(x)
x <- c(1, 9, 24, 32, 59)
integer.floor(x)
integer.ceiling(x)
integer.ceiling(x, base=5)
}
