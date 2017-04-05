\name{na.check}
\alias{na.check}
\alias{print.missings}
\title{Missing Data Analysis}
\description{
Counts the missing data per subject and identifies the subjects who exceed an
established number of missins (tolerance criterion).
}
\usage{
na.check(x, columns = 1:ncol(x), tolerance = 0)
}
\arguments{
    \item{x}{Data frame containing observed data.}
    \item{columns}{Columns of \code{x} to consider in the check.}
    \item{tolerance}{Number of tolerated missings per subject.}
}
\details{
The function provides: the number of missing data per subject (\code{na.count}), the
frequency of each count of missings (\code{frequency}) and its conversion in percentage
(\code{percentage}), an identification of subjects exceeding the tolerance criterion
(\code{selected}) and their positions in the data frame in input (\code{location}).
}
\value{
An object of class \code{missings}.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[testing]{na.impute}}, \code{\link[testing]{knn.impute}}
}
\examples{
data("airquality")
(miss <- na.check(airquality))
str(miss)
}
