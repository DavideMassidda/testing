\name{item.split}
\alias{item.split}
\title{Split Items}
\description{
Given a character string, splits the identity code (usually a number) from the text of the item.
}
\usage{
item.split(item, split = "\\\. ")
}
\arguments{
    \item{item}{Character vector which contains the items.}
    \item{split}{Character value to use for splitting.}
}
\details{
The function \code{strsplit} is used to split the vector of items.
}
\value{
A \code{data.frame} containing two columns. The column \code{id} reports the identity code
of the items, while the column \code{text} reports the text content.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[base]{strsplit}}, \code{\link[testing]{item.shuffle}}
}
\examples{
x1 <- c("1. First item","2. Second item")
x2 <- c("1 - First item","2 - Second item")
item.split(x1)
item.split(x2, split=" - ")
}
