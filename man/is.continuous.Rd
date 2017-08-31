\name{is.continuous}
\alias{is.continuous}
\title{Continuous Vectors}
\description{
Check if a vector represents a continuous sequence of integer values between the minumum and
the maximum, sorted in ascending or descending order.
}
\usage{
is.continuous(x, direction = c("both", "forward", "backward"), na.rm = TRUE)
}
\arguments{
    \item{x}{Numeric vector.}
    \item{direction}{Character value indicating if check the values in ascending order (\code{forward}),
    in descending order (\code{backward}), or in both orders.}
    \item{na.rm}{Logical value specifying if remove missing data before run the procedure.}
}
\details{
Pay attantion that the monotonicity is required. In this sense, \code{is.continuous} is stronger
than \code{is.monotonic}.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{is.monotonic}}
}
\examples{
x <- c(1, 2, 3, 5)
is.continuous(x)
is.monotonic(x)
x <- c(4, 3, 2, 1)
is.continuous(x)
is.monotonic(x)
}
