na.check <-
function(x, columns=1:ncol(x), tolerance=0)
{
    output <- list(na.count=NULL, frequency=NULL, percentage=NULL, selected=NULL, location=NULL)
    output$na.count <- rowSums(is.na(x[,columns]))
    na.max <- max(output$na.count)
    output$frequency <- rep.int(NA,na.max+1)
    for(i in 0:na.max)
        output$frequency[i+1] <- sum(output$na.count == i)
    names(output$frequency) <- 0:na.max
    output$percentage <- output$frequency / nrow(x) * 100
    output$selected <- output$na.count > tolerance
    output$location <- which(output$selected)
    class(output) <- "missings"
    return(output)
}
print.missings <- function(x,...)
{
    cat("Frequency of missings\n")
    print(x$frequency)
    cat("\nPercentage of missings\n")
    x$percentage <- sprintf("%.1f",x$percentage)
    x$percentage <- paste0(x$percentage,"%")
    cat(formatC(names(x$frequency),width=5))
    cat("\n")
    cat(formatC(x$percentage,width=5))
    cat("\n")
}
