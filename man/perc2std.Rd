\name{perc2std}
\alias{perc2std}
\title{Percentile conversion}
\description{
Convert a vector of percentiles in the corresponding standard scores
according to the Normal distribution.
}
\usage{
perc2std(p, scale=c("z","t","nce","iq","wss","stanine","sten"))
}
\arguments{
    \item{p}{Vector of percentiles on a 0-100 scale.}
    \item{scale}{Reference scale of the standard scores.}
}
\details{
Percentiles must be provided on a 0-100 scale.
}
\examples{
perc2std(c(30,50,70), "T")
}
