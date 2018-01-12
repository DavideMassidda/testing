sim.attitude <- function(hits, x.min=min(hits), x.max=max(hits), p=NULL, incr.diff=TRUE,
                         time.limit=FALSE, floor=FALSE, ceiling=FALSE, seed=NULL)
{
    set.seed(seed)
    if((floor+ceiling)==2)
        stop("One between floor and ceiling must be FALSE")
    n <- length(hits) # numero di item
    # Definizione probabilità di risposta:
    if(is.null(p))
        p <- runif(1,0,1)
    if(incr.diff) {
        prob <- seq(p, p/1.2, length=n)
    } else {
        prob <- p
    }
    # Creazione vettore risposte corrette/errate:
    if(!floor & !ceiling) {
        x <- rbinom(n, 1, prob)
    } else {
        if(floor)
            x <- rep.int(0,n)
        if(ceiling)
            x <- rep.int(1,n)  
    }
    # Taglio risposte causa limiti temporali:
    if(time.limit & !ceiling) {
        num.resp <- rbinom(1, n, p) + rbinom(1, trunc(n/(n/7)), p)
        num.resp <- ifelse(num.resp>n, n, num.resp)
        if(num.resp < n) {
            posNA <- (num.resp+1):n
            x[posNA] <- 0
        }
    }
    # Posizioni in cui le risposte sono corrette e sbagliate:
    pos <- list(hit=which(as.logical(x)), fail=which(!x))
    # Generazione pattern di risposta:
    pattern <- rep(NA,n)
    # Assegnazione al pattern delle risposte corrette:
    pattern[pos$hit] <- hits[pos$hit]
    # Assegnazione al pattern delle risposte errate:
    i <- 1
    while(i<=length(pos$fail)) {
        r <- round(runif(1,x.min,x.max))
        if(r!=hits[pos$fail[i]]) {
            pattern[pos$fail[i]] <- r
            i <- i+1
        }
        if(time.limit)
            if(num.resp<n)
                pattern[posNA] <- NA
    }
    # Output
    return(list(resp=pattern,score=x))
}
