\name{rounding}
\alias{integer_round}
\alias{integer_floor}
\alias{integer_ceiling}
\alias{decimal_floor}
\alias{decimal_ceiling}
\title{Rounding of numbers}
\description{
Round a number to the nearest value.
}
\usage{
integer_round(x, upper5 = TRUE)
decimal_floor(x, digits = 1)
decimal_ceiling(x, digits = 1)
integer_floor(x, base=10)
integer_ceiling(x, base=10)
}
\arguments{
    \item{x}{A numeric vector.}
    \item{upper5}{Logical value that regulates the rounding in presence of the decimal .5.}
    \item{digits}{Integer indicating the number of decimal places to consider.}
    \item{base}{
        Integer value to use as step in rounding. The \code{x} values will be rounded to
        the nearest lower/upper \code{base} value.}
}
\details{
\code{integer_round} rounds a decimal number to the nearest integer. When the decimal
is exactly .5, the number is rounded to the upper integer (\code{upper5 = T}).
The opposite behavior is obtained when \code{upper5 = F}.

\code{decimal_floor} and \code{decimal_ceiling} round a decimal number to the nearest
decimal digit, specified by \code{digits}.

\code{integer_floor} and \code{integer_ceiling} round a number to the nearest integer
value specified by \code{base}.
}
\seealso{
\code{\link[base]{round}}
}
\examples{
x <- c(8.87, 9.26, 10.5, 11.5, 12.5)
integer_round(x)
integer_round(x, upper5=FALSE)
round(x) # round has a different behavior for 10.5 and 11.5
decimal_floor(x)
decimal_ceiling(x)
x <- c(1, 9, 24, 32, 59)
integer_floor(x)
integer_ceiling(x)
integer_ceiling(x, base=5)
}
