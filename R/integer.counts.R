integer.counts <- function(x,x.min=min(x),x.max=max(x),perc=FALSE,na.keep=TRUE)
{
    n <- length(x)
    # Conversion to numeric
    if(is.factor(x))
        x <- as.character(x)
    x <- as.integer(x)
    # Missing data management
    na.check <- is.na(x)
    if(!na.keep)
        n <- n-sum(na.check)
    x <- x[!na.check]
    # Frequency calculation
    span <- x.min:x.max
    freq <- sapply(span, function(v) sum(x==v))
    # Conversion to percentages
    if(perc)
        freq <- freq/n*100
    # Preparation to output
    names(freq) <- span
    return(freq)
}
