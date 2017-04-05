write.fwf <- function(x,file="",na=".",append=FALSE,fileEncoding="")
{
    lab <- rownames(x)
    if(!is.null(lab)) {
        numChar <- nchar(lab)
        maxChar <- max(numChar)
        difChar <- numChar-maxChar
        if(sum(difChar) != 0) {
            pos <- which(difChar < 0)
            difChar <- abs(difChar[pos])
            n <- length(pos)
            newLab <- character(n)
            for(i in seq_len(n))
                for(j in 1:difChar[i])
                    newLab[i] <- paste(newLab[i]," ",sep="")
            lab[pos] <- paste(lab[pos],newLab,sep="")
        }
        lab <- paste(lab,"",sep=" ")
        rownames(x) <- lab
    }
    write.table(x, file=file, append=append, quote=FALSE, sep="",
        row.names=TRUE, col.names=FALSE, na=na, fileEncoding=fileEncoding)
}
