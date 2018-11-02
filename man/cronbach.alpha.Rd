\name{cronbach.alpha}
\alias{cronbach.alpha}
\alias{cronbach}
\title{Cronbach's alpha}
\description{
Calculate the Cronbach's Alpha.
}
\usage{
cronbach.alpha(x)
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects and the columns the items.}
}
\details{
Missing data are treated by using listwise deletion.
}
\seealso{
\code{\link[testing]{cronbach.alpha}}, \code{\link[testing]{dropitem}}
}
\examples{
data("drive")
cronbach.alpha(drive[,5:10])
}
