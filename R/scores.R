.integer_round <- function(x) 
{
    neg <- which(x < 0)
    x[neg] <- x[neg] * (-1)
    int.value <- trunc(x)
    dec.value <- x - int.value
    int.value[neg] <- int.value[neg] * (-1)
    return(int.value)
}

# Converte in numerico un intervallo di punteggi
implode <- function(x, fn=mean)
{
    x <- as.character(x)
    x[which(x=="")] <- NA
    x <- gsub("-",",",x)
    x <- paste0(deparse(substitute(fn)),"(c(",x,"))")
    x <- sapply(x, function(x){eval(parse(text=x))})
    return(x)
}

# Srotola una sequenza di punteggi in cui possono essere compresi valori espressi come intervallo
explode <- function(x, direction=c("forward","backward"), sep="-")
{
    direction <- direction[1]
    direction <- match.arg(direction)
    x <- as.character(x)
    x <- gsub(sep,":",x)
    x <- lapply(x, function(x) eval(parse(text=x)))
    if(direction=="backward")
        x <- lapply(x, rev)
    x <- unlist(x)
    x <- .integer_round(as.numeric(x))
    return(x)
}

# Classifica una variabile continua in punteggi interi o intervalli di punteggio
rollup <- function(x, direction=c("forward","backward"))
{
    direction <- direction[1]
    direction <- match.arg(direction)
    # Rimozione posizioni con dati mancanti
    na.check <- is.na(x)
    if(any(na.check)) {
        na.pos <- which(na.check)
        x <- x[-na.pos]
    }
    # Arrotondamento valori
    x <- .integer_round(x)
    # Verifica andamento monotono
    n <- length(x)
    monotonic <- c("incr" = sum(x[-1] >= x[-n]), "decr" = sum(x[-n] >= x[-1]))
    monotonic <- monotonic == (n-1)
    if(sum(monotonic) != 1)
        stop("The vector isn\'t a monotonic sequence.")
    decreasing <- which(monotonic)==2
    if(decreasing)
        x <- rev(x)
    # Individuazione dati ripetuti
    # Rimozione ripetizioni dai limiti
    empty <- which(x[-1] == x[-n])
    # Individuazione limiti intervalli di punteggi
    if(direction=="forward") {
        r <- list(from=x[-n], to=x[-1])
        r$to[r$to > r$from] <- r$to[r$to > r$from]-1
        empty <- empty+1
    } else {
        r <- list(from=x[-1], to=x[-n])
        r$to[r$to < r$from] <- r$to[r$to < r$from]+1
        empty <- empty-1
    }
    r$to[empty] <- r$from[empty] <- NA
    # Inizializzazione vettore di output
    p <- character(n)
    # Collassamento dei punteggi
    if(direction=="forward") {
        for(i in 1:(n-1)) {
            if(is.na(r$from[i]))
                next
            else {
                next.i <- i+1
                if(any(next.i == empty)) {
                    while(any(next.i == empty))
                        next.i <- next.i+1
                    if(next.i < (n-1))
                        if((r$from[next.i]-r$from[i]) > 1)
                            r$to[i] <- r$from[next.i]-1
                }
                if(r$to[i] > r$from[i])
                    p[i] <- paste(r$from[i],r$to[i],sep="-")
                else
                    p[i] <- r$from[i]
            }
        }
        # Aggiunta ultimo valore
        p[n] <- x[n]
    } else { # downward
        for(i in (n-1):1) {
            if(is.na(r$from[i]))
                next
            else {
                next.i <- i-1
                if(any(next.i == empty)) {
                    while(any(next.i == empty))
                        next.i <- next.i-1
                    if(next.i > 1)
                        if((r$from[next.i]-r$from[i]) < -1)
                            r$to[i] <- r$from[next.i]+1
                }
                if(r$to[i] < r$from[i])
                    p[i] <- paste(r$to[i],r$from[i],sep="-")
                else
                    p[i] <- r$from[i]
            }
        }
        # Aggiunta primo valore
        p[-1] <- p[-n]
        p[1] <- x[1]
    }
    if(decreasing)
        p <- rev(p)
    # Restituzione dati mancanti
    if(any(na.check)) {
        x[-na.pos] <- p
        p <- x
    }
    return(p)
}

is.monotonic <- function(x, direction=c("both","forward","backward"), decreasing=NULL, na.rm=TRUE)
{
    # Warning: the argument decreasing is deprecated.
    # It's kept only for backward compatibility.
    direction <- direction[1]
    direction <- match.arg(direction)
    if(!is.null(decreasing)) {
        if(!decreasing & direction=="both")
            direction <- "forward"
        else
            if(decreasing & direction=="both")
            direction <- "backward"
    }
    if(na.rm)
        x <- x[!is.na(x)]
    n <- length(x)
    d <- x[-n] - x[-1]
    check <- c(all(d <= 0), all(d >= 0))
    if(direction=="both")
        check <- check[1] | check[2]
    else
        check <- check[(direction=="backward")+1]
    return(check)
}

is.continuous <- function(x, direction = c("both","forward","backward"), na.rm=TRUE)
{
    direction <- direction[1]
    direction <- match.arg(direction)
    if(na.rm)
        x <- x[!is.na(x)]
    incr <- min(x):max(x)
    decr <- max(x):min(x)
    check <- length(x)==length(incr)
    if(check) {
        if(direction=="forward")
            check <- sum(x!=incr)==0
        if(direction=="backward")
            check <- sum(x!=decr)==0
        if(direction=="both")
            check <- sum(x!=incr)==0 | sum(x!=decr)==0
    }
    return(check)
}
