\name{roc.curve}
\alias{roc.curve}
\title{Receiver Operating Characteristic Curve}
\description{
Plot a ROC (Receiver Operating Characteristic) curve.
}
\usage{
roc.curve(x, xlab = NULL, ylab = NULL, main = NULL, labels = TRUE)
}
\arguments{
    \item{x}{An object of class \code{"ROC"}.}
    \item{xlab}{Label of x-axis.}
    \item{ylab}{Label of y-axis.}
    \item{main}{Title of the plot.}
    \item{labels}{Plot the labels identifying each cutoff value.}
}
\details{
The function \code{roc.table} can be used to compute the sensibility and specificity
for selected cutoffs.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\link[testing]{roc.table}}
}
\examples{
x <- c(3,4,4,0,3,1,2,3,2,2,2,2,3,4,5,1,1,4,2,3,4,2,2,1,5,2,3,5,2,5,1,5,4,3,1)
g <- c(0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,1,1,1,1,0,0,0,1,0,0,1,0,1,0,1,1,1,0)
(tab <- roc.table(x, g))
roc.curve(tab)
}
