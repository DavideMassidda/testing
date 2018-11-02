\name{age.character}
\alias{age.character}
\title{Age Conversion: from Numeric to Character}
\description{
Converts numeric ages into strings expressing the completed years, months and days.
}
\usage{
age.character(x, units = c("years", "months"), depth =c("days", "months", "years"),
    origin.units = c("years","months"), origin.depth = c("days", "months", "years"),
    use.leap = TRUE)
}
\arguments{
    \item{x}{Numeric vector of ages.}
    \item{units}{Character specifying the units of the age in output (years or months).}
    \item{depth}{Character specifying the depth of the age in output (days, months or years).}
    \item{origin.units}{Character specifying the units of the age in input (years or months).}
    \item{origin.depth}{Character specifying the depth of the age in input (days, months or years).}
    \item{use.leap}{Logical specifying if consider or ignore leap years.}
}
\details{
The function accepts inputs in which the integer part represents the elapsed units of ages (years or months)
and the decimal part represents the elapsed portion of elapsed days or months from the last unit, depending
on the depth level.
}
\value{
The age completed by the subject.
}
\seealso{
\code{\link[testing]{age.completed}}, \code{\link[testing]{age.numeric}}, \code{\link[testing]{age.segment}}
}
\examples{
born <- c("2008-02-17", "2010-08-06", "2008-02-21", "2008-06-25", "2008-04-16", "2009-04-16")
test <- c("2012-05-02", "2011-09-17", "2013-03-09", "2012-01-07", "2013-02-11", "2013-02-11")
(age <- age.completed(born, test))
age.character(age, units="years")
age.character(age, units="months")
}
