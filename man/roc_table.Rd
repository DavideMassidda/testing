\name{roc_table}
\alias{roc_table}
\alias{print.ROC}
\alias{plot.ROC}
\title{Receiver Operating Characteristic}
\description{
Calculate the sensibility and the specificity of a psychometric test for candidate cutoffs. and plot a ROC curve.
}
\usage{
roc_table(test, gold.std, cutoff = sort(unique(test)))
## S3 method for class 'ROC'
\method{plot}{ROC}(x, labels = TRUE, \dots)
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
        contained into the vector \code{test} are checked as candidate cutoffs.}
    \item{x}{An object of class \code{"ROC"}.}
    \item{labels}{Logical. If true, plot the labels identifying each cutoff value.}
    \item{...}{Further arguments for the function \code{plot}.}
}
\author{
Davide Massidda <davide.massidda@gmail.com>
}
\examples{
x <- c(3,4,4,0,3,1,2,3,2,2,2,2,3,4,5,1,1,4,2,3,4,2,2,1,5,2,3,5,2,5,1,5,4,3,1)
g <- c(0,0,1,0,0,0,0,1,0,0,0,0,1,1,1,0,0,1,1,1,1,0,0,0,1,0,0,1,0,1,0,1,1,1,0)
(tab <- roc_table(x, g))
plot(tab)
}
