\name{average.r}
\alias{average.r}
\alias{average.r}
\title{Average reliability}
\description{
Calculate the average reliability coefficient using the Fisher's z transformation.
}
\usage{
average.r(r)
}
\arguments{
    \item{r}{Vector of reliability coefficients.}
}
\details{
Only positive values are allowed.
}
\seealso{
\code{\link[testing]{cronbach.alpha}}
}
\examples{
average.r(c(0.8,0.85,0.9))
}
