is.monotonic <- function(x, direction=c("both","forward","backward"), decreasing=NULL, na.rm=TRUE)
{
    # Warning: the argument decreasing is deprecated.
    # It's kept only for backward compatibility.
    direction <- direction[1]
    direction <- match.arg(direction)
    if(!is.null(decreasing)) {
        if(!decreasing & direction=="both")
            direction <- "forward"
        else
            if(decreasing & direction=="both")
            direction <- "backward"
    }
    if(na.rm)
        x <- x[!is.na(x)]
    n <- length(x)
    d <- x[-n] - x[-1]
    check <- c(all(d <= 0), all(d >= 0))
    if(direction=="both")
        check <- check[1] | check[2]
    else
        check <- check[(direction=="backward")+1]
    return(check)
}
