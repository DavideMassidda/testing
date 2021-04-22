.flatten <- function(x, digits, fun)
{
    neg <- x<0
    if(neg)
        x <- x*(-1)
    x <- fun(x*10^digits)/(10^digits)
    if(neg)
        x <- x*(-1)
    return(x)
}

decimal_floor <- function(x, digits=1)
{
    return(sapply(x, .flatten, digits=digits, fun=floor))
}

decimal_ceiling <- function(x, digits=1)
{
    return(sapply(x, .flatten, digits=digits, fun=ceiling))
}

integer_floor <- function(x, base=10)
{
    return(as.integer(base * floor(x/base)))
}

integer_ceiling <- function(x, base=10)
{
    return(as.integer(base * ceiling(x/base)))
}

integer_round <- function(x, upper5=TRUE)
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
    return(as.integer(int.value))
}
