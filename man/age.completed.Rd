\name{age.completed}
\alias{age.completed}
\title{Age Calculation from Dates}
\description{
Calculate the completed age starting by the date of birth and another date (named date of test administration).
}
\usage{
age.completed(born, test, units = c("years", "months"),
    depth = c("days", "months", "years"), use.leap = TRUE,
    output = c("numeric", "character"))
}
\arguments{
    \item{born}{Date of birth (date or character format).}
    \item{test}{Date of test (date or character format).}
    \item{units}{Character specifying the units of age: \code{years} or \code{months}.}
    \item{depth}{Character specifying the depth of the age: \code{days}, \code{months}
        of \code{years}. See details.}
    \item{use.leap}{Logical specifying if consider or ignore leap years.}
    \item{output}{Type of output required. If \code{numeric}, the age is returned as numeric
        value in which the integer part expresses the number of units completed (years or months) and
        the decimal part expresses the proportion of time elapsed from the last unit, depending
        on the level of depth. if \code{character}, the age is returned as string in the form
        "years:months:days", expressing the number of years, months and days completed (depending
        on the level of depth).
    }
}
\details{
Given the birth date and the test date, the function calculate the age of one o more subjects both in
numeric and character format.

The numeric format expresses the number of units of age completed plus the proportion of time elapsed
from the last unit. For example, take a child born the 4th of February, 2012, and tested the 15th of
January, 2013. At the test date, this child has 5 years plus 346/366 days. Differently, considering a
month level of depth, the same subject has 5 years plus 11/12 months. Differently, If we consider the
months as units instead the years, the child has 71 months plus 11/31 days.

Considering the character format, the child of the previous example has 5 years, 11 months and 11 days,
so his age is "5:11:11". Moreover, if we consider the months as units, his age is 71 months and 11 days,
i.e. "71:11".}
\seealso{
\code{\link[testing]{age.numeric}}, \code{\link[testing]{age.character}}, \code{\link[testing]{age.segment}}
}
\examples{
born <- c("2008-02-17","2010-08-06","2008-02-21","2008-06-25","2008-04-16",
          "2009-04-16","2008-04-28","2007-03-21","2007-03-21","2009-12-07",
          "2007-05-21","2007-01-15","2007-01-15","2007-02-04","2007-02-04")
test <- c("2012-05-02","2011-09-17","2013-03-09","2012-01-07","2013-02-11",
          "2013-02-11","2012-02-29","2010-03-12","2016-03-22","2010-01-05",
          "2012-06-03","2012-02-04","2012-03-08","2012-01-15","2013-01-15")
age.completed(born, test, units="years", depth="days")
age.completed(born, test, units="years", depth="months")
age.completed(born, test, units="month", depth="days")
age.completed(born, test, units="years", depth="days", output="char")
age.completed(born, test, units="years", depth="months", output="char")
age.completed(born, test, units="month", depth="days", output="char")
}
