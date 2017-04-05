\name{na.impute}
\alias{na.impute}
\title{Missing Data Imputation}
\description{
Replace missing data by using a single value for each subject or each item.
}
\usage{
na.impute(x, margin = 2, fun = mean, integer = FALSE, ...)
}
\arguments{
    \item{x}{A data frame with missing data.}
    \item{margin}{
        Integer value indicating if the replacement of missings should be performed
        for row/subject (\code{margin=1}) or column/item (\code{margin=2}).}
    \item{fun}{Function to use to calculate values for replacement.}
    \item{\dots}{Further arguments passed to \code{fun}.}
    \item{integer}{Logical. If \code{TRUE}, the function returns integer values.}
}
\details{
If \code{margin=2}, for each item (column) an index is calculated by using the function
\code{fun}; the missing data of the item are replaced by using this values.
If \code{margin=1}, the same job is performed for subjects (rows).

The argument \code{na.rm=T} isn't mandatory (see examples).
}
\value{
A data frame with missing data replaced.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\link[testing]{na.check}},
\code{\link[testing]{knn.impute}},
\code{\link[testing]{integer.round}}
}
\examples{
data(airquiality)
colSums(is.na(airquality))
airquality.imp <- na.impute(airquality)
colSums(is.na(airquality.imp))
}
