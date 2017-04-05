normalize <- function(x, new.min, new.max, x.min=min(x), x.max=max(x))
{
    x.new <- new.min + (new.max - new.min) * (x - x.min)/(x.max - x.min)
    names(x.new) <- names(x)
    return(x.new)
}
