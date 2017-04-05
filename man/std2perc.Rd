\name{std2perc}
\alias{std2perc}
\title{Standard Scores Conversion}
\description{
Convert a vector of standard scores in the corresponding percentiles
according to the Normal distribution.
}
\usage{
std2perc(q, scale=c("z","t","nce","stanine","sten","iq"))
}
\arguments{
    \item{q}{Vector of standard scores.}
    \item{scale}{Reference scale of the standard scores.}
}
\details{
Percentiles are provided on a 0-100 scale.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\examples{
perc2std(c(5,50,95), "IQ")
}
