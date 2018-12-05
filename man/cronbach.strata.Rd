\name{cronbach.strata}
\alias{cronbach.strata}
\title{Stratified Cronbach's alpha}
\description{
Calculate the stratified Cronbach's alpha, measuring the reliability of a composite score,
obtained from the combination of more item or scale scores.
}
\usage{
cronbach.strata(x, r, composite=NULL)
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects and the columns the
      items or the scores to combine.}
    \item{r}{Vector of reliabilities of each item/score included into \code{x}.}
    \item{composite}{Vector of composite scores. The vector must contain a number of
      elements equal to \code{nrow(x)}. If the argument is \code{NULL}, composite scores
      will be calculated as sum of values of \code{x}.}
}
\details{
Missing data are treated by using listwise deletion.
}
\references{
Cronbach, L.J., Schoenemann, P., McKie, D. (1965).
    Alpha coefficient for stratified-parallel tests. \emph{Educational and Psychological Measurement}, 25, 291-312.
}
\seealso{
\code{\link[testing]{cronbach.alpha}}, \code{\link[testing]{dropitem}}
}
\examples{
data("drive")
r <- c(0.97,0.86,0.85,0.99,0.81,0.88)
cronbach.strata(drive[,5:10],r)
}
