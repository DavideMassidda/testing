bubble.plot <- function(x,y,xlab=NULL,ylab=NULL,inches=0.3,...)
{
    tab <- as.data.frame(table(x,y))
    if(is.null(xlab))
        xlab <- deparse(substitute(x))
    if(is.null(ylab))
        ylab <- deparse(substitute(y))
    Freq <- NULL # to satisfy codetools for visible binding
    tab <- subset(tab, Freq > 0)
    tab[,1] <- as.numeric(as.character(tab[,1]))
    tab[,2] <- as.numeric(as.character(tab[,2]))
    with(tab, symbols(x,y,Freq,xlab=xlab,ylab=ylab,inches=inches,...))
}
