\name{parallel}
\alias{parallel}
\alias{print.parallel}
\alias{plot.parallel}
\title{Parallel Analysis}
\description{
Identify the number of components/factors starting by a raw data matrix by using the Parallel Analysis.
}
\usage{
parallel(x, iter = 1000, ordinal = FALSE, method = "perm", alpha = 0.05,
         standard = FALSE, plot = TRUE, fn = eigen, ...)
}
\arguments{
    \item{x}{Data frame or matrix of raw data.}
    \item{iter}{Number of iterations.}
    \item{ordinal}{If \code{TRUE}, the function uses the polychoric/tetrachoric correlation
         instead of the Pearson's index (very slow).}
    \item{method}{Method for random data generation. When \code{method="perm"}, random
         permutations of observed data are used. When \code{method="random"}, random data
         normally distributed are generated.}
    \item{alpha}{Alpha threshold to select the number of components/factors.}
    \item{standard}{If \code{TRUE}, the analysis is performed on standardized data.}
    \item{plot}{Shows the scree plot overlapping the eigen values from the parallel analysis
         to the eigen value from principal comonent analysis (or factor analysis, according to
         the argument \code{fn}.)}
    \item{fn}{Function to calcolate eigenvalues. The default \code{eigen} uses the principal
         component analysis, while \code{psych::fa} calculates eigenvalues according to factor
         analysis.}
    \item{...}{Further arguments for the function \code{fn}.}
}
\details{
The function \code{parallel} was developed starting from the function \code{parpca} (see the
repository: https://github.com/DavideMassidda/parpca).
}
\references{
Buja A., Eyuboglu N. (1992).
Remarks on parallel analysis.
Multivariate Behavioral Research, 27(4), 509-540.

Crawford A.V., Green S.B., Levy R., Lo W.J. Scott L., Svetina D., Thompson M.S. (2010).
Evaluation of parallel analysis methods for determining the number of factors.
Educational and Psychological Measurement, 70(6), 885-901.

Horn J.L. (1965).
A rationale and test for the number of factors in factor analysis.
Psychometrika, 30, 179-185.

Franklin S.B., Gibson D.J., Robertson P.A., Pohlmann J.T., Fralish, J.S. (1995).
Parallel analysis: a method for determining significant principal components.
Journal of Vegetation Science, 6(1), 99-106.

Peres-Neto P.R., Jackson D.A., Somers K.M. (2005).
How many principal components? Stopping rules for determining the number of non-trivial axes revisited.
Computational Statistics and Data Analysis, 49, 974-997.

Weng L.J., Cheng C.P. (2005).
Parallel analysis with unidimensional binary data.
Educational and Psychological Measurement, 65(5), 697-716.
}
\seealso{
\code{\link[psych]{fa.parallel}}, \code{\link[psych]{fa.parallel.poly}}
}
\examples{
# (examples under construction)
}
