reliability <- function(x, cor.method=c("pearson","biserial","polyserial"), fn=sum)
{
    cor.method <- cor.method[1]
    cor.method <- match.arg(cor.method)
    k <- ncol(x)
    r <- matrix(nrow=k,ncol=2)
    rownames(r) <- colnames(x)
    colnames(r) <- c("cor","alpha")
    if(cor.method=="pearson") {
        corFUN <- cor
    } else {
        corFUN <- function(v1,v2) {
            v1 <- data.frame(v1=v1)
            v2 <- data.frame(v2=v2)
            if(cor.method=="polyserial")
                r <- psych::polyserial(v1,v2)[1,1]
            else
                r <- psych::biserial(v1,v2)[1,1]
            return(r)
        }
    }
    for(j in 1:k) {
        total <- apply(x[,-j],1,fn)
        r[j,1] <- corFUN(total,x[,j])
        r[j,2] <- cronbach(x[,-j])
    }
    output <- list(alpha=cronbach(x),item.total=r,cor.method=cor.method)
    class(output) <- "reliability"
    return(output)
}

print.reliability <- function(x,...)
{
    cat("\nOverall Cronbach\'s alpha:",round(x$alpha,2),"\n\n")
    print(round(x$item.total,2))
}