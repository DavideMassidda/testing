\name{sim.attitude}
\alias{sim.attitude}
\title{RaRandom Responses for Attitude Tests}
\description{
Generate a random patttern of dichotomous responses for an attitude test.
}
\usage{
sim.attitude(hits, x.min = min(hits), x.max = max(hits), p = NULL,
    incr.diff = TRUE, time.limit = FALSE, floor = FALSE,
    ceiling = FALSE, seed = NULL)
}
\arguments{
    \item{hits}{Numerical vector of correct responses.}
    \item{x.min}{Minimum observable value.}
    \item{x.max}{Maximum observable value.}
    \item{p}{Probability of correct responses representing the ability of the subject.}
    \item{incr.diff}{Logical value. When \code{TRUE}, the items are assumed with increasing difficulty.}
    \item{time.limit}{Logical value indicating if the responses are done under time pressure.}
    \item{floor}{Logical value. If \code{TRUE}, the function will generate a response pattern with floor effect.}
    \item{ceiling}{Logical value. If \code{TRUE}, the function will generate a response pattern with ceiling effect.}
    \item{seed}{Numerical value to use as seed to generate pseurorandom values.}
}
\details{
The function simulates a response pattern of a subject to an attitude test. This hypothetical test
consist on a set of alternatives in which, for each trial, one alternative is right and the
others are wrong.
}
\value{
A \code{list} object in which the first element (\code{pattern}) contains the simulated responses
and the second element (\code{score}) indicates if each response is correct (1) or uncorrect (0).
}
\examples{
# Simulation of responses for a test with fifteen items
# and four response alternatives (coded from 1 to 4).
# -> vector of correct responses:
correct <- c(1, 2, 1, 3, 3, 4, 3, 2, 1, 2, 2, 2, 4, 1, 4)
# -> simulation:
sim.attitude(correct, seed=16)
# -> simulation with time pressure:
sim.attitude(correct, p=0.7, time.limit=TRUE, seed=46)
# (NAs represent missed responses, which are considered wrong)
}
