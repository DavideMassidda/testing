is.monotonic <- function(x, decreasing=FALSE, na.rm=TRUE)
{
    if(na.rm)
        x <- x[!is.na(x)]
    d <- x[-length(x)] - x[-1]
    if(!decreasing)
        check <- all(d <= 0)
    else
        check <- all(d >= 0)
    return(check)
}
