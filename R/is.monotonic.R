is.monotonic <- function(x, decreasing=FALSE)
{
    d <- x[-length(x)] - x[-1]
    if(!decreasing)
        check <- all(d <= 0)
    else
        check <- all(d >= 0)
    return(check)
}
