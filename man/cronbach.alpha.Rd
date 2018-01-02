\name{cronbach.alpha}
\alias{cronbach.alpha}
\alias{cronbach}
\title{Cronbach's alpha}
\description{
Calculate the Cronbach's alpha.
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
\references{
Cronbach, L.J., Schoenemann, P., McKie, D. (1965).
    Alpha coefficient for stratified-parallel tests. \emph{Educational and Psychological Measurement}, 25, 291-312.
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
