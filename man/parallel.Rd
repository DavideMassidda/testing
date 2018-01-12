\name{parallel}
\alias{parallel}
\alias{print.parallel}
\alias{plot.parallel}
\title{Parallel Analysis}
\description{
To describe
}
\usage{
parallel(x, iter = 1000, ordinal = FALSE, method = "perm", alpha = 0.05,
         standard = FALSE, plot = TRUE, fn = fa, ...)
}
\arguments{
    \item{x}{Data frame or matrix with raw data.}
    \item{iter}{Number of iterations.}
    \item{ordinal}{If \code{TRUE}, use the polychoric/tetrachoric correlation instead
         the Pearson's index (very slow).}
    \item{method}{Method for generating random data. When \code{method="perm"}, random
         permutations of observed data are used. When \code{method="random"}, random data
         normally distributed are generated.}
    \item{alpha}{Alpha threshold to select the number of factors.}
    \item{standard}{If \code{TRUE}, the analysis is performed on standardized data.}
    \item{plot}{Plot the scree plot overlapping the eigen values from the parallel analysis
         to the eigen value from factor analysis (or PCA, according to the argument \code{fn}.)}
    \item{fn}{Function to calcolate eigenvalues. The default \code{fa} uses the factor analysis,
         while \code{eigen} calculates eigenvalues according to the principal component analysis.}
    \item{...}{Further arguments to the function \code{fn}.}
}
\details{
The function \code{principal} was developed starting from the function \code{parpca} (see the
repository: https://github.com/DavideMassidda/parpca).
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[psych]{fa.parallel}}
}
\examples{
# to do
}
