\name{cronbach_alpha}
\alias{cronbach_alpha}
\alias{cronbach}
\title{Cronbach's alpha}
\description{
Calculate the Cronbach's Alpha.
}
\usage{
cronbach_alpha(x)
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects and the columns the items.}
}
\details{
Missing data are treated by using listwise deletion.
}
\seealso{
\code{\link[testing]{cronbach_strata}}, \code{\link[testing]{drop_item}}
}
\examples{
data("drive")
cronbach_alpha(drive[,5:10])
}
