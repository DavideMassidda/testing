\name{drive}
\alias{drive}
\docType{data}
\title{Secure Drive Project}
\description{
Data collected in an Italian secondary school at the end of a cycle of lessons
regarding the secure drive.
}
\usage{data("drive")}
\details{
The item responses were provided on a five-points scale, where just the extreme categories
where labeled (1: strongly disagree, 5: strongly agree).
}
\examples{
data("drive")
str(drive)
it <- paste0("item",1:5)
drive$total <- rowSums(drive[,it])
}
\keyword{datasets}
