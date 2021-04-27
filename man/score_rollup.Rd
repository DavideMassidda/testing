\name{score_rollup}
\alias{score_rollup}
\title{Score intervals}
\description{
Classifies a numeric sequence of scores into a sequence of classes of scores.
}
\usage{
score_rollup(x, x.min = NULL, x.max = NULL,
    direction = c("forward", "backward"),
    extremes = c(FALSE, FALSE))
}
\arguments{
    \item{x}{Numeric vector sorted in ascending or descending order.}
    \item{x.min}{Theoretical minimum of \code{x}.}
    \item{x.max}{Theoretical minimum of \code{x}.}
    \item{direction}{Specify if the classification of scores must be performed in
        ascending (\code{forward}) or descending (\code{backward}) order. Default
        is \code{forward}.}
    \item{extremes}{Should a value be assigned to extreme scores?.
        The argument can include two logical values, the first one refferring to
        the lower extreme, the second one referring to the upper extreme.
        If just one value is provided, it will be used for both extremes.}
}
\details{
Missed scores must be coded by using an empty string.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{score_implode}}, \code{\link[testing]{score_explode}}
}
\examples{
x <- c(1,9,12,12,13,14,15,15,17,18,19,19,19,20,21,22,23,24)
xf <- score_rollup(x,x.min=0,x.max=24,direction="forward")
xb <- score_rollup(x,x.min=0,x.max=24,direction="backward")
data.frame(x,xf,xb)
}
