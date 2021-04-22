\name{raw2std}
\alias{raw2std}
\title{Conversion of Raw Scores from a Norm Table}
\description{
Scoring of a vector of observed raw scores leaning on a norm table.
}
\usage{
raw2std(x, std.norm, raw.norm, sep="-")
}
\arguments{
    \item{x}{Vector or observed raw scores.}
    \item{raw.norm}{Raw scores corresponding to each standard score of the vector \code{std.norm}.}
    \item{std.norm}{Standard scores corresponding to each raw score of the vector \code{raw.norm}.}
    \item{sep}{Symbol used to separate the extremes of an interval.}
}
\details{
The vectors \code{raw.norm} and \code{std.norm} come from a norm table and provide the
correspondence between raw scores and standard scores.
}
\seealso{
\code{\link[testing]{std_score}}, \code{\link[testing]{score_explode}}
}
\examples{
norms <- data.frame(
    std = 19:1,
    raw = c("25-30","24","22-23","21","19-20","18","16-17","15",
    "13-14","12","10-11","9" ,"7-8","6","4-5","2-3","1",NA,"0")
)
raw.observed <- c(27,17,12,22,28,3,18,29,9,4,10,21,24,21,9,26,2,16,23,8)
raw2std(raw.observed, norms$std, norms$raw)
}
