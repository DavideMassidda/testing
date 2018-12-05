\name{std2perc}
\alias{std2perc}
\title{Standard scores conversion}
\description{
Convert a vector of standard scores in the corresponding percentiles
according to the Normal distribution.
}
\usage{
std2perc(q, scale=c("z","t","nce","iq","wss","stanine","sten"))
}
\arguments{
    \item{q}{Vector of standard scores.}
    \item{scale}{Reference scale of the standard scores.}
}
\details{
Percentiles are provided on a 0-100 scale.
}
\examples{
perc2std(c(5,50,95), "IQ")
}
