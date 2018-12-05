\name{item.shuffle}
\alias{item.shuffle}
\title{Items shuffling}
\description{
Randomize a sequence of items.
}
\usage{
item.shuffle(item, id = NULL, scale = NULL, tolerance = 0, fixed = NULL)
}
\arguments{
    \item{item}{Character vector containing the text of the items.}
    \item{id}{Vector coding the identity of items.}
    \item{scale}{Vector indicating the scale of each item.}
    \item{tolerance}{
        Maximum number of items of the same scale that can be placed consecutively.}
    \item{fixed}{Positions of fixed items, not to randomize.}
}
\details{
If the \code{scale} argument is specified, items will be randomized within each scale.
Fixed items, if specified, will be left in the same position of the original vector.
}
\seealso{
\code{\link[testing]{item.split}}
}
\examples{
# (examples under construction)
}
