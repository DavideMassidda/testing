\name{age_numeric}
\alias{age_numeric}
\title{Age conversion: from character to numeric}
\description{
Converts ages expressed as years, months and days into approximated numeric values.
}
\usage{
age_numeric(x, units = c("years", "months"), depth = c("days", "months", "years"),
    origin.units = c("years", "months"), use.leap = TRUE)
}
\arguments{
    \item{x}{Character vector of ages expressed as "years:months:days" (for example: "6:5:7" for
        six years, six months and seven days). Alternatively, a numeric matrix in which the first
        column is the value for years, the second column is the value for months and the third
        column is the value for days. Only the years are mandatory.}
    \item{units}{Character specifying the units of the age in output (years or months).}
    \item{depth}{Character specifying the depth of the age in output (days, months or years).}
    \item{origin.units}{Character specifying the units of the age in input (days, months or years).}
    \item{use.leap}{Logical specifying if consider or ignore leap years.}
}
\details{
If \code{origin.unit = "years"}, the function accept values expressed as: "years", "years:months"
and "years:months:days", depending on the depth level. If \code{origin.unit = "months"},
the function accept values expressed as: "months" and "months:days".

Input values as days=31 and month=12 aren't allowed. When a subject completes all the days included
in a month, jump to the following month, setting days=0. Similarly, when a subject completes 12 months
of a year, jump to the following year, setting months=0.

}
\value{
The age completed by the subject.
}
\seealso{
\code{\link[testing]{age_completed}}, \code{\link[testing]{age_character}}, \code{\link[testing]{age_segment}}
}
\examples{
born <- c("2008-02-17", "2010-08-06", "2008-02-21", "2008-06-25", "2008-04-16", "2009-04-16")
test <- c("2012-05-02", "2011-09-17", "2013-03-09", "2012-01-07", "2013-02-11", "2013-02-11")
(age <- age_completed(born, test, output="character"))
age_numeric(age, units="years")
age_numeric(age, units="months")
}
