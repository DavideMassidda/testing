\name{bubble.plot}
\alias{bubble.plot}
\title{Bubble Plot}
\description{
Generate a scatterplot using the frequency of each data to define the size of the dots.
}
\usage{
bubble.plot(x, y, xlab = NULL, ylab = NULL, inches = 0.3, ...)
}
\arguments{
    \item{x}{A numeric vector for x-asis. Integer values are preferred.}
    \item{y}{A numeric vector for y-axis. Integer values are preferred.}
    \item{xlab}{Label for x-axis.}
    \item{ylab}{Label for y-axis.}
    \item{inches}{Value controlling the sizes of the symbols.}
    \item{\dots}{Further graphics parameters for the function \code{symbols}.}
}
\details{
The function can be useful to visualize the relation between integer or ordinal variables,
as Likert-type responses.
}
\references{
Massidda, D. (2015).
[Visualizing the relation between Likert variables].
URL http://www.insular.it/?p=3688
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\link[graphics]{symbols}}
}
\examples{
data("drive")
# See the difference between plot and bubble.plot:
par(mfrow=c(1,2))
with(drive, plot(item5, item6, main="Scatter-plot"))
with(drive, bubble.plot(item5, item6, main="Bubble-plot"))
}
