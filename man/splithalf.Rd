\name{splithalf}
\alias{splithalf}
\title{Split-half reliability}
\description{
Calculate the correlation between two halves of an item set, adjusting the value using
the Spearman-Brown prophecy formula.
}
\usage{
splithalf(x, set1 = seq(1,ncol(x),by=2))
}
\arguments{
    \item{x}{A data frame in which the rows represents the subjects
        and the columns the items.}
    \item{set1}{Column indices of the first set of items (the second
        set is automatically identified).}
}
\details{
Missing data are treated by using listwise deletion.
}
\seealso{
\code{\link[testing]{cronbach.alpha}}, \code{\link[testing]{cronbach.strata}}
}
\examples{
data("drive")
splithalf(drive[,5:10])
}
