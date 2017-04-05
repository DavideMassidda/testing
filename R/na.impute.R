na.impute <-
function(x, margin=2, fun=mean, integer=FALSE, ...)
{
    if(margin != 1 & margin != 2)
        stop("margin must be =1 or =2")
    if(margin == 2) {
        for(i in 1:ncol(x)) {
            na.check <- is.na(x[,i])
            if(sum(na.check) > 0) {
                m <- fun(x[-which(na.check),i],...)
                if(integer)
                    m <- integer.round(m)
                x[which(na.check),i] <- m
            }
        }
    } else {
        for(i in 1:nrow(x)) {
            na.check <- is.na(x[i,])
            if(sum(na.check) > 0) {
                m <- fun(x[i,-which(na.check)],...)
                if(integer)
                    m <- integer.round(m)
                x[i,which(na.check)] <- m
            }
        }
    }
    return(x)
}
