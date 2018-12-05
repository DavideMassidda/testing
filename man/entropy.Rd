\name{entropy}
\alias{entropy}
\title{Entropy index}
\description{
Calculus of the Shannon's etropy index.
}
\usage{
entropy(x, base = exp(1), inverse = FALSE)
}
\arguments{
    \item{x}{Numeric vector.}
    \item{base}{Basis of the logarithm.}
    \item{inverse}{Logical specifying if reverse the result by using the inverse function.}
}
\details{
When \code{inverse = T}, the entropy H is corrected by using the formula: base^H.
In this case, the entropy will be included between 1 and the numbers of categories
of \code{x}.
}
\examples{
x <- c(1,1,1,1, 2,2,2,2, 3,3,3,3, 4,4,4,4, 5,5,5,5)
entropy(x, inverse=TRUE)

x <- c(0,0,0,0, 1,1,1,1, 2,2,2,2, 3,3,3,3, 4,4,4,4)
entropy(x, inverse=TRUE)

x <- c(1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1)
entropy(x, inverse=TRUE)
entropy(x)

x <- c(1,1,1,1, 1,1,1,1, 4,4,5,5, 5,5,5,5, 5,5,5,5)
entropy(x, inverse=TRUE)
entropy(x)
}
