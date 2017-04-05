cronbach <- function(x)
{
    x <- na.omit(x)
    itemVar <- sum(apply(x,2,var))
    totalVar <- var(apply(x,1,sum))
    K <- ncol(x)
    alpha <- (K/(K-1))*(1-(itemVar/totalVar))
    return(alpha)
}
