\name{stdscore}
\alias{stdscore}
\title{From raw scores to standard scores}
\description{
Rescale a vector of raw scores on a giver standard scale.
}
\usage{
stdscore(x, m = NULL, s = NULL,
    scale = c("z","t","nce","iq","wss","stanine","sten"),
    integer = FALSE, out.names = NULL)
}
\arguments{
    \item{x}{Vector of raw scores.}
    \item{m}{Mean of observed data.}
    \item{s}{Standard deviation of the population. If \code{NULL}, the mean of \code{x} will be used.}
    \item{scale}{Reference scale of the population. If \code{NULL}, the standard deviation of \code{x}
        will be used.}
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
