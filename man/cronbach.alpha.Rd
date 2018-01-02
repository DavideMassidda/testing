\name{cronbach.alpha}
\alias{cronbach.alpha}
\alias{cronbach}
\title{Cronbach's alpha}
\description{
Calculate the Cronbach's alpha.
}
\usage{
cronbach(x)
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects and the columns the items.}
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
cronbach.alpha(drive[,5:10])
}
