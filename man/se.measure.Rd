\name{se.measure}
\alias{se.measure}
\title{Standard error of measurement}
\description{
Calculate the standard error of measurement (SEM) for a test score.
}
\usage{
se.measure(r, s)
}
\arguments{
    \item{r}{Vector of reliabilities.}
    \item{s}{Standard deviation of the scores.}
}
\details{
The standard error of measurement is function of the reliability of the test and its
standard deviation. It quantifies the error of estimation of a true test score from
the observed test scores.
}
\seealso{
\code{\link[testing]{cronbach.alpha}}
}
\examples{
se.measure(0.9, s=15)
}
