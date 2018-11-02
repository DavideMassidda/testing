\name{fisher.z}
\alias{fisher.z}
\alias{invfisher.z}
\title{Fisher's z transformation}
\description{
Functions to calculate the z-transformation of a vector of reliability coefficients and the inverse
z-transformation of a vector of z-transformed reliability coefficients.
}
\usage{
fisher.z(r)
invfisher.z(z)
}
\arguments{
    \item{r}{Vector of reliability coefficients.}
    \item{z}{Vector of z-transformed reliability coefficients.}
}
\details{
Only positive values are allowed.
}
\seealso{
\code{\link[testing]{average.r}}, \code{\link[testing]{cronbach.alpha}}
}
\examples{
(z <- fisher.z(0.9))
invfisher.z(z)
}
