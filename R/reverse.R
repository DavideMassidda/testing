reverse <- function(x, x.min=min(x), x.max=max(x))
{
    x.new <- x.max-x+x.min
    return(x.new)
}
