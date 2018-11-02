\name{kr20}
\alias{kr20}
\title{Kuder-Richardson Formula 20}
\description{
Calculate the Kuder-Richardson Formula 20.
}
\usage{
kr20(x,hit=1)
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects and the columns the items.}
    \item{hit}{Value in \code{x} indicating correct responses.}
}
\details{
Missing data are treated by listwise deletion.
}
\seealso{
\code{\link[testing]{cronbach.alpha}}, \code{\link[testing]{dropitem}}
}
\examples{
data("drive")
m <- data.frame(drive[,5:10]>=4)
kr20(m, hit=TRUE)
}
