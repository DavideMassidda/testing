roc_table <- function(test, gold.std, cutoff=sort(unique(test)))
{
    n <- length(cutoff)
    output <- list(Cutoff=cutoff,Se=NA,Sp=NA)
    for(i in 1:n) {
        check <- factor(test >= cutoff[i], levels=c(FALSE,TRUE))
        tab <- table(gold.std, check)
        output$Se[i] <- as.numeric(tab[2,2]/(tab[2,1]+tab[2+2]))
        output$Sp[i] <- as.numeric(tab[1,1]/(tab[1,1]+tab[1,2]))
    }
    class(output) <- "ROC"
    return(output)
}

print.ROC <- function(x, ...)
{
    output <- data.frame(
        Sensibility = sprintf("%.4f",x$Se),
        Specificity = sprintf("%.4f", x$Sp)
    )
    rownames(output) <- paste("Cutoff:",x$Cutoff)
    print(output)
}

plot.ROC <- function(x, labels=TRUE, ...)
{
    xlab <- list(...)$xlab
    ylab <- list(...)$ylab
    if(is.null(xlab))
        xlab <- "False positive rate (1-specificity)"
    if(is.null(ylab))
        ylab <- "True positive rate (sensibility)"
    if(is.null(labels))
        labels <- FALSE
    cutoff <- round(x[["Cutoff"]],1)
    Se <- x[["Se"]]
    Sp <- x[["Sp"]]
    p <- seq(0,1,by=0.1)
    plot(1-Sp,Se,xlim=c(0,1),ylim=c(0,1),xaxt="n",yaxt="n",col="white",xlab="",ylab="")
    segments(p,0,p,1,lty=1,lwd=2,col="gray80")
    segments(0,p,1,p,lty=1,lwd=2,col="gray80")
    abline(0,1)
    par(new=TRUE)
    plot(1-Sp,Se,xlim=c(0,1),ylim=c(0,1),cex=2.2,pch=21,bg="gray50",
        type="b",lwd=2,cex.lab=1.2,xlab=xlab,ylab=ylab,...)
    if(labels)
        text(1-Sp,Se,labels=cutoff,col="white",cex=0.8)
}
