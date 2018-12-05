\name{rollup}
\alias{rollup}
\title{Score intervals}
\description{
Classifies a numeric sequence of scores into a sequence of classes of scores.
}
\usage{
rollup(x, x.min = NULL, x.max = NULL,
    direction = c("forward", "backward"), extremes = FALSE)
}
\arguments{
    \item{x}{Numeric vector sorted in ascending or descending order.}
    \item{x.min}{Theoretical minimum of \code{x}.}
    \item{x.max}{Theoretical minimum of \code{x}.}
    \item{direction}{Specify if the classification of scores must be performed in
        ascending (\code{forward}) or descending (\code{backward}) order. Default
        is \code{forward}.}
    \item{extremes}{Should a value be assigned to extreme scores?}
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
x <- c(1,9,12,12,13,14,15,15,17,18,19,19,19,20,21,22,23,24)
xf <- rollup(x,x.min=0,x.max=24,direction="forward")
xb <- rollup(x,x.min=0,x.max=24,direction="backward")
data.frame(x,xf,xb)
}
