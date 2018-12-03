prank <- function(x, breaks, fun="<=", perc=TRUE, digits=1, out.names=as.character(breaks))
{
    .Deprecated("percrank",package="testing",msg="\'prank\' is deprecated. Use \'percrank\' instead.")
    percrank(x,breaks,fun,perc,digits,out.names)
}

likert.counts <- function(x,x.min=min(x),x.max=max(x),perc=FALSE,na.keep=TRUE)
{
    .Deprecated("integer.counts",package="testing",msg="\'likert.counts\' is deprecated. Use \'integer.counts\' instead.")
    integer.counts(x,x.min,x.max,perc,na.keep)
}
