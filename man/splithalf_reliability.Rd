\name{splithalf_reliability}
\alias{splithalf_reliability}
\title{Spearman-Brown prophecy formula for split-half reliability}
\description{
Calculate the split-half reliability using the correlation between two halves
of an item set, corrected by the Spearman-Brown prophecy formula.
}
\usage{
splithalf_reliability(x1, x2)
}
\arguments{
    \item{x1}{A data frame for the first split, in which the rows represents
        the subjects and the columns the items.}
    \item{x2}{A data frame for the second split, in which the rows represents
        the subjects and the columns the items.}
}
\details{
Missing data are treated by using listwise deletion.
}
\seealso{
\code{\link[testing]{cronbach_alpha}}
}
\examples{
data("drive")
splithalf_reliability(drive[,5:7], drive[,8:10])
}
