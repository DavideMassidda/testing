\name{kr20}
\alias{kr20}
\title{Kuder–Richardson Formula 20}
\description{
Calculate the Kuder–Richardson Formula 20.
}
\usage{
kr20(x,hit=1)
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects and the columns the items.}
    \item{hit}{Value in \code{x} indicating correct responses.}
}
\details{
Missing data are treated by using listwise deletion.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{reliability}}
}
\examples{
data("drive")
m <- data.frame(drive[,5:10]>=4)
kr20(m, hit=TRUE)
}
