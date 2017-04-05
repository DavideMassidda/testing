\name{write.fwf}
\alias{write.fwf}
\title{Export Data in a Fixed-Width Format}
\description{
Export a data frame using a fixed-width format. Useful for software as Winsteps.
}
\usage{
write.fwf(x, file="", na = ".", append = FALSE, fileEncoding = "")
}
\arguments{
    \item{x}{The object to be written, preferably a matrix or data frame.}
    \item{file}{A character string naming a file or a connection open for writing.
        \code{""} indicates output to the console.}
    \item{na}{The string to use for missing values. The dot is the default.}
    \item{append}{If \code{TRUE}, the output is appended to the file.}
    \item{fileEncoding}{the encoding to be used on a file. See \code{file}.}
}
\details{
The row names are used as subject's identity code.
}
\author{
Davide Massidda \email{davide.massidda@gmail.com}
}
\seealso{
\code{\link[utils]{write.table}}
}
\examples{
data("drive")
str(drive)
write.fwf(drive[1:10,5:10])
}
