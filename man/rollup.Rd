\name{rollup}
\alias{rollup}
\title{Score Intervals}
\description{
Classifies a numeric sequence of scores into a sequence of classes of scores.
}
\usage{
rollup(x, direction = c("forward", "backward"))
}
\arguments{
    \item{x}{Numeric vector sorted in ascending or descending order.}
    \item{direction}{Specify if the classification of scores must be performed in
        ascending (\code{forward}) or descending (\code{backward}) order. Default
        is (\code{forward}).}
}
\details{
Missed scores must be coded by using an empty string.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{implode}}, \code{\link[testing]{explode}}
}
\examples{
x <- data.frame(integer=rev(c(1,3,3,4,5,6,7,7,7,8,9,10,11,14,14,15,16,16,17,19)))
x$forward <- rollup(x$integer)
x$backward <- rollup(x$integer, direction="backward")
x
}
