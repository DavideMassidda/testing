item.shuffle <-
function(item, id=NULL, scale=NULL, tolerance=0, fixed=NULL)
{
    item <- as.character(item)
    if(!is.null(fixed)) {
        fixed.item <- item[fixed]
        item <- item[-fixed]
        if(!is.null(id)) {
            fixed.id <- id[fixed]
            id <- id[-fixed]
        }
        if(!is.null(scale)) {
            fixed.scale <- scale[fixed]
            scale <- scale[-fixed]
        }
    }
    if(tolerance < 0)
        tolerance <- 0
    n <- length(item)
    new.id <- 1:n
    count <- tolerance+1
    while(count > tolerance) {
        ran.pos <- sample(new.id, size=n, replace=FALSE)
        count <- 0
        if(!is.null(scale)) {
            ran.scale <- scale[ran.pos]
            for(i in 2:n)
                count <- count + (ran.scale[i-1]==ran.scale[i])
        }
    }
    item <- item[ran.pos]
    if(!is.null(id))
        id <- id[ran.pos]
    if(!is.null(scale))
        scale <- scale[ran.pos]
    if(!is.null(fixed)) {
        for(i in 1:length(fixed)) {
            item <- append(item, fixed.item[i], after=fixed[i]-1)
            if(!is.null(id))
                id <- append(id, fixed.id[i], after=fixed[i]-1)
            if(!is.null(scale))
                scale <- append(scale, fixed.scale[i], after=fixed[i]-1)
        }
    }
    out <- data.frame(item=item,new.id=1:length(item),stringsAsFactors=FALSE)
    if(!is.null(id))
        out$old.id <- id
    if(!is.null(scale))
        out$scale <- scale
    return(out)
}

item.split <-
function(item, split="\\. ")
{
    item <- as.character(item)
    splitted <- unlist(strsplit(item,split))
    id <- splitted[seq(1,length(splitted),by=2)]
    text <- splitted[seq(2,length(splitted),by=2)]
    return(data.frame(id,text,stringsAsFactors=FALSE))
}

