\name{rawscore}
\alias{rawscore}
\title{From Standard Scores to Raw Scores}
\description{
Identify the raw scores corresponding to a vector of standard scores.
}
\usage{
rawscore(q, m, s,
    scale = c("z","t","nce","iq","wss","stanine","sten"),
    integer = FALSE, out.names = NULL)
}
\arguments{
    \item{q}{Vector of standard scores.}
    \item{m}{Mean of observed data.}
    \item{s}{Standard deviation of the population. If \code{NULL}, the mean of \code{x} will be used.}
    \item{scale}{Reference scale of the population. If \code{NULL}, the standard deviation of \code{x}
        will be used.}
    \item{integer}{Logical. If \code{TRUE}, data in output will bet rounded to nearest integer.}
    \item{out.names}{Names for the elements in the output vector (use \code{NULL} to exclude names).}
}
\details{
The arguments \code{m} and \code{s} are mandatory.
}
\seealso{
\code{\link[testing]{stdscore}}
}
\examples{
std <- c(37, 41, 43, 43, 46, 48, 56, 59, 61, 67)
rawscore(std, m=30, s=5.4, scale="T")
}
