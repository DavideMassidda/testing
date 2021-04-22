\name{average_reliab}
\alias{average_reliab}
\alias{average_reliab}
\title{Average reliability}
\description{
Calculate the average reliability coefficient using the Fisher's z transformation.
}
\usage{
average_reliab(r)
}
\arguments{
    \item{r}{Vector of reliability coefficients.}
}
\details{
Only positive values are allowed.
}
\seealso{
\code{\link[testing]{cronbach_alpha}}
}
\examples{
average_reliab(c(0.8,0.85,0.9))
}
