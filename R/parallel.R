parallel <- function(x, iter=1000, ordinal=FALSE, method="perm", alpha=0.05, standard=FALSE, plot=TRUE, fn=eigen, ...)
{
    x <- as.matrix(x)
    nRows <- dim(x)[1]
    nComp <- ncol(x)
    if(!ordinal) {
        numGEN <- rnorm
        corfn <- cor
        correlation <- "pearson"
    } else {
        maxCateg <- max(x)-min(x)
        numGEN <- function(n) return(rbinom(n,maxCateg,0.5))
        if(maxCateg == 1) {
            corfn <- function(m,N) return(psych::tetrachoric(m)$rho)
            correlation <- "tetrachoric"
        } else {
            corfn <- function(m,N) return(psych::polychoric(m)$rho)
            correlation <- "polychoric"
        }
    }
    if(!ordinal & standard) {
        m <- apply(x,2,mean,na.rm=TRUE)
        s <- apply(x,2,sd,na.rm=TRUE)
        for(i in 1:nComp)
            x[,i] <- (x[,i]-m[i])/s[i]
    }
    rowIndex <- 1:nRows
    xRand <- vector("list",iter)
    randLoad <- matrix(NA,ncol=nComp,nrow=iter)
    eigenVal <- fn(corfn(x),...)$values
    colnames(randLoad) <- names(eigenVal) <- paste("c",1:nComp,sep="")
    if(method=="random") {
        for(i in 1:iter) {
            xRand[[i]] <- matrix(NA,nrow=nRows,ncol=nComp)
            for(j in 1:nComp) xRand[[i]][,j] <- numGEN(nRows)
            randLoad[i,] <- fn(corfn(xRand[[i]]),...)$values
        }
    } else {
        if(method=="perm") {
            N <- length(x)
            K <- 1:N
            V <- c(x)
            for(i in 1:iter) {
                xRand[[i]] <- matrix(V[sample(K,size=N,replace=FALSE)],nrow=nRows,ncol=nComp)
                randLoad[i,] <- fn(corfn(xRand[[i]]),...)$values
            }
        }
    }
    z <- abs(qnorm(alpha/2))
    rM <- colMeans(randLoad)
    rSE <- apply(randLoad,2,mean)/sqrt(nRows)
    rQ <- apply(randLoad,2,quantile,probs=c(1-alpha/2,0.5,alpha/2))
    rCI <- rbind(rM+rSE,rM,rM-rSE)
    rownames(rCI) <- c("CI Sup","Mean","CI Inf")
    result <- list(
        correlation = correlation,
        method = method,
        synthetic.eigen = randLoad,
        pca.eigen = eigenVal,
        parallel.CI = rCI,
        parallel.quantiles = rQ
    )
    class(result) <- "parallel"
    if(plot) plot(result)
    return(result)
}

print.parallel <- function(x,...)
{
    x$method <- ifelse(x$method=="random","Random Data","Permutations")
    cat("Parallel Analysis by",x$method,"\n")
    cat("Correlation matrix:",x$correlation,"\n\n")
    cat("Observed values:\n")
    print(round(rbind("eigen"=x$pca.eigen),2))
    cat("\nParallel Confidence Intervals:\n")
    print(round(x$parallel.CI,2))
    cat("\nParallel Quantiles:\n")
    print(round(x$parallel.quantiles,2))
}

plot.parallel <- function(x,...)
{
    main <- list(...)$main
    xlab <- list(...)$xlab
    ylab <- list(...)$ylab
    if(is.null(main))
        main <- "Parallel Analysis"
    if(is.null(xlab))
        xlab <- "Component number"
    if(is.null(ylab))
        ylab <- "Eigenvalue"
    nComp <- length(x$pca.eigen)
    component <- 1:nComp
    Q <- x$parallel.quantiles[1,]
    xlim <- c(1,nComp)
    ylim <- c(0,ceiling(max(c(x$pca.eigen,x$parallel.quantiles[1,]))))
    col <- c("gray56","black")
    # Simulated data
    stripchart(Q~component,vertical=TRUE,xlim=xlim,ylim=ylim,col=col[1],pch=20,cex=1.7,cex.lab=1.1,main=main,xlab=xlab,ylab=ylab)
    segments(component[-nComp],Q[-nComp],component[-1],Q[-1],col=col[1],lwd=1.5)
    par(new=TRUE)        
    # Observed data
    stripchart(x$pca.eigen~component,vertical=TRUE,xlim=xlim,ylim=ylim,xlab="",ylab="",pch=20,cex=1.7,col=col[2])
    segments(component[-nComp],x$pca.eigen[-nComp],component[-1],x$pca.eigen[-1],lwd=1.5)
    # Segment for eigen=1
    segments(0,1,nComp+1,1,lty=2)
}
