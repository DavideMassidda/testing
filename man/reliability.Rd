\name{reliability}
\alias{reliability}
\alias{print.reliability}
\title{Internal Consistence}
\description{
Verify the internal consistence by using the item-total correlation.
}
\usage{
reliability(x, cor.method = c("pearson","biserial","polyserial"), fn = sum)
}
\arguments{
    \item{x}{Data frame of observed data.}
    \item{cor.method}{Type of correlation to use.}
    \item{fn}{Function to use to calculate the total scores.}
}
\details{
The total score if calculated by omitting the item under analysis.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{cronbach.alpha}}
}
\examples{
data("drive")
reliability(drive[,5:10])
}
