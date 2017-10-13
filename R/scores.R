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
    if(!is.character(x)) {
        vn <- names(x)
        x <- as.character(x)
        names(x) <- vn
    }
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
    if(!is.character(x)) {
        vn <- names(x)
        if(is.null(vn))
            vn <- seq_len(length(x))
        x <- as.character(x)
        names(x) <- vn
    }
    x <- gsub(sep,":",x)
    x <- lapply(x, function(x) eval(parse(text=x)))
    if(direction=="backward")
        x <- lapply(x, rev)
    x <- unlist(x)
    x <- .integer_round(as.numeric(x))
    return(x)
}

# Classifica una variabile continua in punteggi interi o intervalli di punteggio
rollup <- function(x, x.min=NULL, x.max=NULL, direction=c("forward","backward"))
{
    direction <- direction[1]
    direction <- match.arg(direction)
    forward <- direction=="forward"
    # Rimozione posizioni con dati mancanti
    na.check <- is.na(x)
    if(any(na.check)) {
        if(sum(na.check) < length(x)) {
            na.pos <- which(na.check)
            x <- x[-na.pos]
        } else
            return(x)
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
    # Calcolo del minimo e massimo
    if(is.null(x.min))
        x.min <- min(x,na.rm=TRUE)
    if(is.null(x.max))
        x.max <- max(x,na.rm=TRUE)
    # Classificazione dei valori
    # -> individuazione e rimozione dei valori duplicati
    dupl <- which(duplicated(x,fromLast=!forward))
    if(length(dupl) > 0) {
        x[dupl] <- NA
        v <- x[-dupl]
    } else
        v <- x
    n <- length(v)
    # -> individuazione dei limiti degli intervalli
    if(forward) {
        from <- c(v[-n],v[n])
        to <- c(v[-1]-1,x.max)
        from[1] <- x.min
    } else {
        from <- c(x.min,v[-n]+1)
        to <- c(v[1],v[-1])
        to[length(to)] <- x.max
    }
    # -> collassamento dei valori
    from <- as.character(from)
    to <- as.character(to)
    v <- paste(from,to,sep="-")
    intervals <- which(from==to)
    v[intervals] <- from[intervals]
    # -> sostituzione dei valori originali con quelli collassati
    if(length(dupl) > 0)
        x[-dupl] <- v
    else
        x <- v
    # -> rigiramento del vettore
    if(decreasing)
        x <- rev(x)
    # -> reintroduzione dei dati mancanti
    if(any(na.check)) {
        output <- rep.int(NA,length(x)+sum(na.check))
        output[-na.pos] <- x
    } else
        output <- x
    return(output)
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
