\name{roc.table}
\alias{roc.table}
\alias{print.ROC}
\title{Receiver Operating Characteristic Table}
\description{
Calculate the sensibility and the specificity of a test for candidate cutoffs.
}
\usage{
roc.table(test, gold.std, cutoff = sort(unique(test)))
}
\arguments{
    \item{test}{Numeric vector reporting the score obtained of a test for a group of persons.}
    \item{gold.std}{
        Dichotomous vector reporting the classification performed by another test,
        considered as gold standard. The first value identifies negative people, the second
        value positive people.}
    \item{cutoff}{
        Numeric vector containing the thresholds at which to calculate the sensibility and the
        specificity of the test. For each threshold, people reporting a test value equal or
        greater of the threshold value are considered as positive. As default, all the values
        contained into the vector \code{test} are checked as candidate cutoffs.
    }
}
\details{
The function provides the basic tools to study the ROC. For further analyses, see other packages.

The function \code{roc.curve} can be used to plot the results.
}
\value{
An object of class \code{ROC}.
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\seealso{
\code{\link[testing]{roc.curve}}
}
\examples{
x <- c(3,4,4,0,3,1,2,3,2,2,2,2,3,4,5,1,1,4,2,3,4,2,2,1,5,2,3,5,2,5,1,5,4,3,1)
g <- c(0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,1,1,1,1,0,0,0,1,0,0,1,0,1,0,1,1,1,0)
(tab <- roc.table(x, g))
roc.curve(tab)
}
