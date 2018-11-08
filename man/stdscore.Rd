\name{stdscore}
\alias{stdscore}
\title{From Raw Scores to Standard Scores}
\description{
Rescale a vector of raw scores on a giver standard scale.
}
\usage{
stdscore(x, m = NULL, s = NULL,
    scale = c("z","t","nce","iq","scaled","stanine","sten"),
    integer = FALSE, out.names = as.character(x))
}
\arguments{
    \item{x}{Vector of raw scores.}
    \item{m}{Mean of observed data.}
    \item{s}{Standard deviation of observed data.}
    \item{scale}{Reference scale of the standard scores.}
    \item{integer}{Logical. If \code{TRUE}, data in output will bet rounded to nearest integer.}
    \item{out.names}{Names for the elements in the output vector (use \code{NULL} to exclude names).}
}
\details{
If \code{m} or \code{s} are \code{NULL}, the mean or the standard deviation
of \code{x} will be used to scale the observed data.
}
\seealso{
\code{\link[testing]{rawscore}}
}
\examples{
raw <- c(23, 25, 26, 26, 28, 29, 33, 35, 36, 39)
stdscore(raw, scale="T")
}
