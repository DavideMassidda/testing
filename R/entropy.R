entropy <-
function(x, base = exp(1), inverse = FALSE) 
{
    f <- table(x)
    p <- f/sum(f)
    ln.p <- log(p,base=base)
    ln.p[ln.p == (-Inf)] <- 0
    H = -sum(p * ln.p)
    if(inverse)
        H <- base^H
    return(H)
}

