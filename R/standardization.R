# Data una certa scala, estrae la media e la deviazione standard di riferimento
.scale_param <- function(scale=c("z","t","nce","iq","scaled","stanine","sten"))
{
    scale <- tolower(scale[1])
    scale <- match.arg(scale)
    m <- switch(scale,"z"=0,"t"=50,"nce"=50,"iq"=100,"scaled"=10,"stanine"=5,"sten"=5.5)
    s <- switch(scale,"z"=1,"t"=10,"nce"=49/qnorm(0.99),"iq"=15,"scaled"=3,"stanine"=2,"sten"=2)
    return(list(m=m,s=s))
}

# Converte un punteggio grezzo in punteggio standardizzato
stdscore <- function(x,m=NULL,s=NULL,scale=c("z","t","nce","iq","scaled","stanine","sten"),integer=FALSE,out.names=as.character(x))
{
    if(is.null(m))
        m <- mean(x,na.rm=TRUE)
    if(is.null(s))
        s <- sd(x,na.rm=TRUE)
    n <- list("m"=length(m),"s"=length(s))
    if(n$m>1 & n$s==1) {
        s <- rep.int(s,n$m)
        n$s <- n$m
    } else {
        if(n$m==1 & n$s>1) {
            m <- rep.int(m,n$s)
            n$m <- n$s
        }
    }
    if(n$m != n$s)
        stop("m and s must be the same length.")
    pars <- .scale_param(scale=scale)
    if(n$m==1) {
        q <- pars$m + pars$s * ((x-m)/s)
        names(q) <- out.names
    } else {
        q <- sapply(seq_len(n$m),
            function(i)
                pars$m + pars$s * ((x-m[i])/s[i])
        )
        cn <- names(m)
        if(is.null(cn))
            cn <- names(s)
        colnames(q) <- cn
        rownames(q) <- out.names
        q <- data.frame(q, check.names=FALSE)
    }
    if(integer) {
        if(n$m==1)
            q <- integer.round(q)
        else
            q[,] <- apply(q, 2, integer.round)
    }
    return(q)
}

# Converte un punteggio standardizzato in punteggio grezzo
rawscore <- function(q,m,s,scale=c("z","t","nce","iq","scaled","stanine","sten"),integer=FALSE,out.names=as.character(q))
{
    n <- list("m"=length(m),"s"=length(s))
    if(n$m>1 & n$s==1) {
        s <- rep.int(s,n$m)
        n$s <- n$m
    } else {
        if(n$m==1 & n$s>1) {
            m <- rep.int(m,n$s)
            n$m <- n$s
        }
    }
    if(n$m != n$s)
        stop("m and s must be the same length.")
    pars <- .scale_param(scale=scale)
    if(n$m==1) {
        x <- m+(s*(q-pars$m))/pars$s
        names(x) <- out.names
    } else {
        x <- sapply(seq_len(n$m),
            function(i)
                m[i]+(s[i]*(q-pars$m))/pars$s
        )
        cn <- names(m)
        if(is.null(cn))
            cn <- names(s)
        colnames(x) <- cn
        rownames(x) <- out.names
        x <- data.frame(x, check.names=FALSE)
    }
    if(integer) {
        if(n$m==1)
            x <- integer.round(x)
        else
            x[,] <- apply(x, 2, integer.round)
    }
    
        
    return(x)
}

# Calcola il rango percentile corrispondente a un punteggio grezzo
prank <- function(x, breaks, fun="<=", perc=TRUE, digits=1, names=TRUE)
{
    x <- as.vector(x[!is.na(x)])
    r <- numeric(length(breaks))
    for(i in 1:length(breaks))
        r[i] <- sum(outer(x, breaks[i], fun))
    r <- r/length(x)
    if(perc)
        r <- r*100
    if(!is.null(digits))
        r <- round(r,digits)
    if(names)
        names(r) <- breaks
    return(r)
}

# Calcola il percentile teorico corrispondente a un punteggio standardizzato
perc2std <- function(p, scale=c("z","t","nce","iq","scaled","stanine","sten"))
{
    pars <- .scale_param(scale=scale)
    z <- qnorm(p/100)
    q <- pars$m + pars$s * z
    return(q)
}

# Calcola il punteggio standardizzato corrispondente a un percentile teorico
std2perc <- function(q, scale=c("z","t","nce","iq","scaled","stanine","sten"))
{
    pars <- .scale_param(scale=scale)
    z <- (q - pars$m) / pars$s
    p <- pnorm(z) * 100
    return(p)
}
