.dfloor <- function(x, digits)
{
    neg <- x<0
    if(neg)
        x <- x*(-1)
    x <- floor(x*10^digits)/(10^digits)
    if(neg)
        x <- x*(-1)
    return(x)
}

decimal.floor <- function(x, digits=1)
    return(sapply(x, .dfloor, digits))

.dceiling <- function(x, digits)
{
    neg <- x<0
    if(neg)
        x <- x*(-1)
    x <- ceiling(x*10^digits)/(10^digits)
    if(neg)
        x <- x*(-1)
    return(x)
}

decimal.ceiling <- function(x, digits=1)
    return(sapply(x, .dceiling, digits))

integer.round <- function(x, upper5=TRUE)
{
    neg <- which(x < 0)
    x[neg] <- x[neg]*(-1)
    int.value <- trunc(x)
    dec.value <- x - int.value
    if(upper5)
        upper.step <- as.integer(dec.value>=0.5)
    else
        upper.step <- 0L
    int.value <- int.value + upper.step
    int.value[neg] <- int.value[neg]*(-1)
    return(int.value)
}

integer.floor <- function(x, base=10)
    return(base * floor(x/base))

integer.ceiling <- function(x, base=10)
    return(base * ceiling(x/base))

# Round to the nearest odd number (for knn.impute)
.round.odd <- function(x)
{
    x <- c(floor(x),ceiling(x))
    x <- x[(x %% 2)==1]
    return(x[1])
}
