kr20 <- function(x,hit=1)
{
    x <- na.omit(x)
    k <- ncol(x)
    n <- nrow(x)
    x <- data.frame(apply(x==hit, 2, as.numeric))
    totalVar <- var(apply(x, 1, sum))
    p <- colSums(x)/n
    q <- 1-p
    r <- (k/(k-1))*(1-sum(p*q)/totalVar)
    return(r)
}

cronbach.alpha <- function(x)
{
    x <- na.omit(x)
    itemVar <- sum(apply(x,2,var))
    totalVar <- var(apply(x,1,sum))
    k <- ncol(x)
    r <- (k/(k-1))*(1-(itemVar/totalVar))
    return(r)
}

cronbach.strata <- function(x, r, composite=NULL)
{
    if(length(r) != ncol(x))
        stop("The number of elements of r is different to the number of columns of x.")
    if(is.null(composite))
        composite <- rowSums(x)
    v <- sapply(x, var, na.rm=TRUE)
    r <- 1-sum(v*(1-r))/var(composite, na.rm=TRUE)
    return(r)
}

splithalf <- function(x, set1=seq(1,ncol(x),by=2))
{
    x <- na.omit(x)
    set2 <- seq_len(ncol(x))[-set1]
    x1 <- rowSums(x[,set1])
    x2 <- rowSums(x[,set2])
    r <- cor(x1,x2)
    r <- (2*r)/(1+r)
    return(r)
}

fisher.z <- function(r)
    0.5*log((1+r)/(1-r))

invfisher.z <- function(z)
    (exp(2*z)-1)/(exp(2*z)+1)

average.r <- function(r)
    invfisher.z(mean(fisher.z(c(r))))

dropitem <- function(x, cor.method=c("pearson","biserial","polyserial"), fn=sum)
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
        r[j,2] <- cronbach.alpha(x[,-j])
    }
    output <- list(alpha=cronbach.alpha(x),item.total=r,cor.method=cor.method)
    class(output) <- "dropitem"
    return(output)
}

print.dropitem <- function(x,...)
{
    cat("\nOverall Cronbach\'s alpha:",round(x$alpha,2),"\n\n")
    print(round(x$item.total,2))
}
