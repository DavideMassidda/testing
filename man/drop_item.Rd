\name{drop_item}
\alias{drop_item}
\alias{print.drop_item}
\title{Internal consistency reliability}
\description{
Verify the internal consistency of a scale by dropping items individually.
}
\usage{
drop_item(x, cor.method = c("pearson", "biserial", "polyserial"), fn = sum)
}
\arguments{
    \item{x}{Data frame of observed data.}
    \item{cor.method}{Type of correlation to use.}
    \item{fn}{Function to use to calculate total scores.}
}
\details{
The function delete deleting each item in turn, computing at each time the correlation between the new total
score and the deleted item. Moreover, the function calculate the variation in Cronbach's alpha following the
deletion of the target item.
}
\seealso{
\code{\link[testing]{cronbach_alpha}}, \code{\link[testing]{split_half}}
}
\examples{
data("drive")
drop_item(drive[,5:10])
}
