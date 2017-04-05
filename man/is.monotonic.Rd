\name{is.monotonic}
\alias{is.monotonic}
\title{Monotonic Vectors}
\description{
Check if the values in a vector are a monotonic sequence.
}
\usage{
is.monotonic(x, decreasing = FALSE)
}
\arguments{
    \item{x}{Numeric vector.}
    \item{decreasing}{Logical which indicate if check the sequence in a decreasing sense.}
}
\details{
da descrivere
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[stats]{isoreg}}
}
\examples{
x <- c(1.3, 2.2, 3.8, 3.3, 5.6, 6.1, 8.0, 8.0, 8.9, 9.9)
plot(x, type="l")
is.monotonic(x)
x[3:4] <- mean(x[3:4])
is.monotonic(x)
}
