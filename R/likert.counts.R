likert.counts <- function(x,x.min=min(x),x.max=max(x),perc=FALSE,na.keep=TRUE)
{
    n <- length(x)
    # Conversion to numeric
    if(is.factor(x))
        x <- as.character(x)
    x <- as.numeric(x)
    # Missing data management
    na.check <- is.na(x)
    if(!na.keep)
        n <- n-sum(na.check)
    x <- x[!na.check]
    # Frequency calculation
    scale <- x.min:x.max
    freq <- rep.int(NA,length(scale))
    for(i in 1:length(scale))
        freq[i] <- sum(x==scale[i])
    names(freq) <- scale
    # Conversion to percentages
    if(perc)
        freq <- freq/n*100
    return(freq)
}
