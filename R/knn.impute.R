.euclidean <- function(x1,x2)
{
    x1 <- as.numeric(x1)
    x2 <- as.numeric(x2)
    distance <- sum(abs(x1-x2))
    similarity <- 1/(1+distance)
    return(similarity)
}

.manhattan <- function(x1,x2)
{
    x1 <- as.numeric(x1)
    x2 <- as.numeric(x2)
    distance <- sum((x1-x2)^2)
    similarity <- 1/(1+distance)
    return(similarity)
}

.matching <- function(x1,x2)
{
    x1 <- as.numeric(x1)
    x2 <- as.numeric(x2)
    #tab <- table(x1,x2)
    #similarity <- sum(diag(tab))/sum(tab)
    similarity <- sum(x1==x2)/length(x1)
    return(similarity)
}

knn.impute <-
function(x, k=NULL, distance=c("euclidean","manhattan","matching"), use=c("IC","CC"), fun=weighted.mean, integer=FALSE, standard=TRUE)
{
    distance <- distance[1]
    distance <- match.arg(distance)
    use <- toupper(use[1])
    use <- match.arg(use)
    if(distance == "matching") {
    #    if(length(table(x))!=2)
    #        stop("Distance \'matching\' can be used only with dichotomus variables")
        standard <- FALSE
    }
    similFUN <- switch(distance,"euclidean"=.euclidean,"manhattan"=.manhattan,"matching"=.matching)
    isWMEAN <- deparse(substitute(fun)) == "weighted.mean"
    fun <- match.fun(fun)
    full.cases <- complete.cases(x)
    if(sum(full.cases) == 0)
        stop("Data must contain at least a complete case")
    if(is.null(k)) {
        k <- sqrt(sum(full.cases))
        k <- .round.odd(k)
    }
    full.cases <- which(full.cases)
    seq.k <- seq_len(k-1)
    x.imputed <- x
    if(standard)
        for(i in seq_len(ncol(x)))
            x[,i] <- (x[,i]-mean(x[,i],na.rm=TRUE))/sd(x[,i],na.rm=TRUE)
    na.check <- list(miss = is.na(x), done = !is.na(x))
    na.pos <- which(rowSums(na.check$miss) > 0)
    for(i in 1:length(na.pos)) {
        miss.col <- which(na.check$miss[na.pos[i],])
        done.col <- which(na.check$done[na.pos[i],])
        if(length(done.col) == 0) {
            warning("The case ",na.pos[i]," is full NAs. None replacement has been done.")
            next
        }
        for(j in 1:length(miss.col)) {
            if(use == "IC") {
                filled.col <- c(miss.col[j],done.col)
                donors <- which(complete.cases(x[,filled.col]))
            } else
                donors <- full.cases
            similarities <- rep.int(NA,length(donors))
            for(q in seq_len(length(donors)))
                similarities[q] <- similFUN(x[na.pos[i],done.col], x[donors[q],done.col])
            donors.pos <- order(similarities,decreasing=TRUE)
            donors.add <- which((similarities[donors.pos[k]]-similarities)==0)
            selected <- c(donors.pos[seq.k],donors.add)
            neighbour <- x.imputed[donors[selected], miss.col[j]]
            if(isWMEAN)
                imputed.value <- weighted.mean(neighbour, w=similarities[selected])
            else
                imputed.value <- fun(neighbour)
            if(integer)
                imputed.value <- integer.round(imputed.value)
            x.imputed[na.pos[i],miss.col[j]] <- imputed.value
        }
    }
    return(x.imputed)
}
