\name{age.segment}
\alias{age.segment}
\title{Grouping by age segmentation}
\description{
The function allows to classify a group of subjects according their age. A a vector of ages, is
segmented finding the band containing each element.
}
\usage{
age.segment(x, breaks, labels = NULL, factor = TRUE)
}
\arguments{
    \item{x}{Character vector of completed ages. Alternatively, a data matrix containing the same
        information. More levels of depth are allowed (see details).}
    \item{breaks}{Character vector specifying the lower limit of each age band. The intervals
        defining the bands are left-closed and right-opened. The last element of \code{breaks}
        represents the upper limit of the last band, which is excluded from the interval.}
    \item{labels}{Labels to assign to age bands.}
    \item{factor}{Logical. Should the resulting vector be a factor?}
}
\details{
The function requires an input vector expressing the completed age in character format, using
the colon character \code{:} as separator. If the age units are years, the input age can be
expressed as "years", "years:months" or "years:months:days", according to the level of depth.
Similarly, if the age units are months, the input age can be expressed as "months" or "months:days".

The vector \code{breaks} reports the lower limits of each bands, except the last element, which
reports the upper limit of the last band. For example, to define two bands, the first one including
ages between 6:0:0 and 6:5:30, and the second one including ages between 6:6:0 and 6:11:30, you can
define: \code{breaks=c("6:0","6:6","7:0")}.

The function converts both \code{x} and \code{breaks} into numeric ages by using the function
\code{age.numeric} and find the interval including each value in \code{x}.
}
\seealso{
\code{\link[testing]{age.numeric}}, \code{\link[base]{cut}}, \code{\link[base]{findInterval}}
}
\examples{
age <- c("2:5","2:6","2:9","2:10","2:11","3:0","3:4",
    "3:5","3:6","3:7","3:11","3:11:30","4:0","4:1")
group <- age.segment(age,
    breaks=c("2:6","3:0","3:6","4:0"),
    labels=c("2:6-2:11","3:0-3:5","3:6-3:11")
)
data.frame(age,group)
}
