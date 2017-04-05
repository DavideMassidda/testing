\name{rawscore}
\alias{rawscore}
\title{From Standard Scores to Raw Scores}
\description{
Identify the raw scores corresponding to a vector of standard scores.
}
\usage{
rawscore(q, m, s, scale = c("z","t","nce","stanine","sten","iq"),
    integer = FALSE)
}
\arguments{
    \item{q}{Vector of standard scores.}
    \item{m}{Mean of observed data.}
    \item{s}{Standard deviation of observed data.}
    \item{scale}{Reference scale of the standard scores.}
    \item{integer}{Logical. If \code{TRUE}, data in output will bet rounded to nearest integer.}
}
\details{
The arguments \code{m} and \code{s} are mandatory.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\link[testing]{stdscore}}
}
\examples{
std <- c(37, 41, 43, 43, 46, 48, 56, 59, 61, 67)
rawscore(std, m=30, s=5.4, scale="T")
}
