\name{is.monotonic}
\alias{is.monotonic}
\title{Monotonic Vectors}
\description{
Check if the values in a vector are a monotonic sequence.
}
\usage{
is.monotonic(x, direction = c("both","forward","backward"),
    decreasing = NULL, na.rm = TRUE)
}
\arguments{
    \item{x}{Numeric vector.}
    \item{direction}{Character value indicating if check the monotonic trend only for a
        particular direction.}
    \item{decreasing}{Deprecated. Use \code{direction} instead.}
    \item{na.rm}{Logical value specifying if remove missing data before run the procedure.}
}
\details{
da descrivere
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[stats]{isoreg}}, \code{\link[testing]{is.continuous}}
}
\examples{
x1 <- c(1.3, 2.2, 3.8, 3.3, 5.6, 6.1, 8.0, 8.0, 8.9, 9.9)
is.monotonic(x1)
x2 <- x1
# Smoothing of x1
x2[3:4] <- mean(x2[3:4])
is.monotonic(x2)
}
