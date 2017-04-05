# Data una certa scala, estrae la media e la deviazione standard di riferimento
.scale_param <- function(scale=c("z","t","nce","stanine","sten","iq"))
{
    scale <- tolower(scale[1])
    scale <- match.arg(scale)
    m <- switch(scale,"z"=0,"t"=50,"nce"=50,"stanine"=5,"sten"=5.5,"iq"=100)
    s <- switch(scale,"z"=1,"t"=10,"nce"=49/qnorm(0.99),"stanine"=2,"sten"=2,"iq"=15)
    return(list(m=m,s=s))
}

# Converte un punteggio grezzo in punteggio standardizzato
stdscore <- function(x,m=NULL,s=NULL,scale=c("z","t","nce","stanine","sten","iq"),integer=FALSE)
{
    if(is.null(m))
        m <- mean(x,na.rm=TRUE)
    if(is.null(s))
        s <- sd(x,na.rm=TRUE)
    pars <- .scale_param(scale=scale)
    z <- (x-m)/s
    q <- pars$m + pars$s * z
    if(integer)
        q <- integer.round(q)
    return(q)
}

# Converte un punteggio standardizzato in punteggio grezzo
rawscore <- function(q,m,s,scale=c("z","t","nce","stanine","sten","iq"),integer=FALSE)
{
    pars <- .scale_param(scale=scale)
    x <- m+(s*(q-pars$m))/pars$s
    if(integer)
        x <- integer.round(x)
    return(x)
}

# Calcola il rango percentile corrispondente a un punteggio grezzo
prank <- function(x, breaks, perc=TRUE, digits=1, names=TRUE)
{
    x <- x[!is.na(x)]
    r <- numeric(length(breaks))
    for(i in 1:length(breaks))
        r[i] <- sum(x <= breaks[i])
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
perc2std <- function(p, scale=c("z","t","nce","stanine","sten","iq"))
{
    pars <- .scale_param(scale=scale)
    z <- qnorm(p/100)
    q <- pars$m + pars$s * z
    return(q)
}

# Calcola il punteggio standardizzato corrispondente a un percentile teorico
std2perc <- function(q, scale=c("z","t","nce","stanine","sten","iq"))
{
    pars <- .scale_param(scale=scale)
    z <- (q - pars$m) / pars$s
    p <- pnorm(z) * 100
    return(p)
}
