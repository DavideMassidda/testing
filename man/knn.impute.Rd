\name{knn.impute}
\alias{knn.impute}
\title{Missing Data Replacement by k-Nearest Neighbour}
\description{
Replacement of missing data for psychological questionnaires structured by Likert-type items.
}
\usage{
knn.impute(x, k = NULL, distance = c("euclidean", "manhattan", "matching"),
           use = c("IC", "CC"), fun = weighted.mean, integer = FALSE, standard = TRUE)
}
\arguments{
    \item{x}{A data frame with responses on a Likert-type scale.}
    \item{k}{The number of subjects to include into the neighbor.}
    \item{distance}{Character. Type of distance.}
    \item{use}{
        Character. Type of cases to consider in the neighbor:
        \code{IC} = Incomplete Cases; \code{CC} = Complete Cases.}
    \item{fun}{Function to aggregate the data of the neighbor.}
    \item{integer}{Logical. Specifies if return integer values.}
    \item{standard}{Logical. If \code{TRUE}, the process make use of standardized data.}
}
\details{
The function implements the method described by Jönsson and Wohlin (2004, 2006).

For large datasets, the replacements process can be very slow.
}
\value{
A data frame with missing data replaced.
}
\references{
Jönsson P. and C. Wohlin (2004). An Evaluation of k-nearest Neighbour Imputation
Using Likert Data. Proceedings 10th International Symposium pn Software Metrics,
pp. 108-118, Chiaco, USA. Selected for special issue.

Jönsson P. and C. Wohlin (2006). Benchmarking k-nearest neighbour imputation with
homogeneous Likert data. Empirical Software Engineering, 11, 463–489.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\code{\link[testing]{na.impute}}}
}
\examples{
data(airquiality)
colSums(is.na(airquality))
airquality.imp <- knn.impute(airquality)
colSums(is.na(airquality.imp))
}
