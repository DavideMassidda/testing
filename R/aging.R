.is_leap <- function(year)
{
    d4 <- (year%%4)==0
    d100 <- (year%%100)==0
    d400 <- (year%%400)==0
    d4 & (!d100 | d100 & d400)
}

.month_days <- function(year,month)
{
    x <- c(31L,28L,31L,30L,31L,30L,31L,31L,30L,31L,30L,31L)
    if(.is_leap(year))
        x[2] <- x[2]+1L
    x <- x[month]
    return(x)
}

.year_align <- function(x,year=NULL,leap=FALSE,date=TRUE)
{
    if(is.null(year))
        year <- ifelse(!leap,2001L,2000L)
    x <- strsplit(as.character(x),"-")
    x <- sapply(1:length(x), function(i) paste(year[i],x[[i]][2],x[[i]][3],sep="-"))
    if(date)
        x <- as.Date(x)
    else
        x <- as.character(x)
    return(x)
}

age_completed <- function(born, test, units=c("years","months"),
    depth=c("days","months","years"), use.leap=TRUE, output=c("numeric","character"))
{
    units <- match.arg(units)
    depth <- match.arg(depth)
    output <- match.arg(output)
    born <- as.Date(born)
    test <- as.Date(test)
    # Argument checks
    if(units=="months" & depth=="years")
        stop("Conflict between \'units\' and \'depth\': set depth=\'months\'.")
    n <- length(test)
    if(n != length(born))
        stop("Input vectors \'born\' and \'test\' must have the same length.")
    if(any(test < born, na.rm=TRUE))
        stop("Test date must be after the birth date.")
    # Missing data deletion
    na.free <- which(!is.na(born) & !is.na(test))
    born <- born[na.free]
    test <- test[na.free]
    # Date decomposition
    born.year <- as.numeric(format(born,format="%Y"))
    test.year <- as.numeric(format(test,format="%Y"))
    born.month <- as.numeric(format(born,format="%m"))
    test.month <- as.numeric(format(test,format="%m"))
    born.day <- as.numeric(format(born,format="%d"))
    test.day <- as.numeric(format(test,format="%d"))
    # Check for leap year
    check29 <- list(born=(born.month==2 & born.day==29), test=(test.month==2 & test.day==29))
    if(use.leap) {
        leap.year <- check29$born | check29$test
    } else {
        if(any(check29$born)) {
            born[check29$born] <- born[check29$born]-1
            born.day[check29$born] <- 28
        }
        if(any(check29$test)) {
            test[check29$test] <- test[check29$test]-1
            test.day[check29$test] <- 28
        }
        leap.year <- rep.int(FALSE,n)
        # Total days within the current year
        total.days <- rep.int(365,n)
    }
    born.aligned <- .year_align(born,leap=leap.year)
    test.aligned <- .year_align(test,leap=leap.year)
    # Days elapsed within the entire arc, considering years with 365 days
    days <- as.numeric(365*(test.year-born.year)+(test.aligned-born.aligned))
    if(use.leap) {
        born.beyond.test <- born.aligned > test.aligned
        last.birthday <- ifelse(born.beyond.test,
            .year_align(born,year=test.year-1,date=FALSE),
            .year_align(born,year=test.year,date=FALSE)
        )
        last.birthday <- as.Date(last.birthday)
        next.birthday <- ifelse(born.beyond.test,
            .year_align(born,year=test.year,date=FALSE),
            .year_align(born,year=test.year+1,date=FALSE)
        )
        next.birthday <- as.Date(next.birthday)
        # Total days within the current year
        total.days <- as.integer(next.birthday-last.birthday)
        # Days elapsed within the current year
        current.year.days <- as.integer(test-last.birthday)
    } else {
        # Days elapsed within the current year
        current.year.days <- days %% 365
    }
    # Elapsed years
    elapsed.years <- trunc(days/365)
    # Elapsed months within the current year
    elapsed.months <-
        ifelse(test.month <= born.month, test.month+12, test.month) -
        born.month +
        ifelse(test.day < born.day, -1, 0)
    elapsed.months[which(elapsed.months>11)] <- 0
    # Month before the test date
    prev.month <- test.month-1
    prev.month <- ifelse(prev.month<1,12,prev.month)
    # Number of days width the current month
    current.month.days <- sapply(1:n,
        function(i) {
            if(test.day[i] < born.day[i])
                d <- .month_days(test.year[i],prev.month[i])
            else
                d <- .month_days(test.year[i],test.month[i])
            return(d)
        }
    )
    # Elapsed days within the current month
    elapsed.days <- ifelse(test.day<born.day,current.month.days-born.day+test.day,test.day-born.day)
    # Output
    if(output=="numeric") {
        if(units=="years")
            age.calc <- switch(depth,
                "days" = elapsed.years+current.year.days/total.days,
                "months" = elapsed.years+elapsed.months/12,
                "years" = elapsed.years
            )
        else
            age.calc <- switch(depth,
                "days" = elapsed.years*12+elapsed.months+elapsed.days/current.month.days,
                "months" = elapsed.years*12+elapsed.months
            )
        age.calc <- as.numeric(age.calc)
    } else {
        if(units=="years")
            age.calc <- switch(depth,
                "days" = paste(elapsed.years,elapsed.months,elapsed.days,sep=":"),
                "months" = paste(elapsed.years,elapsed.months,sep=":"),
                "years" = as.character(elapsed.years)
            )
        else
            age.calc <- switch(depth,
                "days" = paste(elapsed.years*12+elapsed.months,elapsed.days,sep=":"),
                "months" = as.character(elapsed.years*12+elapsed.months)
            )
    }
    age.out <- rep.int(NA,n)
    age.out[na.free] <- age.calc
    return(age.out)
}

.age_explode <- function(x)
{
    n <- length(x)
    if(all(!is.na(x)))
        v <- 0
    else
        v <- NA
        x <- c(x,rep(v,3-n))
    x <- as.integer(x)
    return(x)
}

age_numeric <- function(x, units=c("years","months"), depth=c("days","months","years"),
    origin.units=c("years","months"), use.leap=TRUE)
{
    units <- match.arg(units)
    depth <- match.arg(depth)
    origin.units <- match.arg(origin.units)
    if(is.null(dim(x))) {
        x <- strsplit(as.character(x),":")
        x <- lapply(x,.age_explode)
        x <- do.call(rbind,x)
    }
    if(origin.units=="years") {
        years <- x[,1]
        months <- x[,2]
        days <- x[,3]
    } else {
        years <- trunc(x[,1]/12)
        months <- x[,1]-(years*12)
        days <- x[,2]
    }
    if(any(days > 30, na.rm=TRUE)) {
        if(any(months==31,na.rm=TRUE))
            stop(paste0("Invalid value days=31, please update the month setting: month=month+1, days=0."))
        else
            stop("Invalid value for days.")
    }
    if(any(months > 11, na.rm=TRUE)) {
        if(any(months==12,na.rm=TRUE))
            stop(paste0("Invalid value months=12, please update the year setting: years=years+1, months=0."))
        else
            stop("Invalid value for months.")
    }
    if(use.leap)
        total.days <- list(m=30.4375,y=365.25)
    else
        total.days <- list(m=30.41667,y=365)
    if(units=="years")
        age.calc <- switch(depth,
            "days" = years+(months*total.days$m+days)/total.days$y,
            "months" = years+months/12,
            "years" = years
        )
    else {
        age.calc <- switch(depth,
            "days" = years*12+months+days/total.days$m,
            "months" = years*12+months,
        )
        age.calc <- years*12+months+days/total.days$m
        # (months*total.days$m+(x-trunc(x))*total.days$m)/total.days$y
    }
    return(age.calc)
}

age_character <- function(x, units=c("years","months"), depth=c("days","months","years"),
    origin.units=c("years","months"), origin.depth=c("days","months","years"), use.leap=TRUE)
{
    units <- match.arg(units)
    depth <- match.arg(depth)
    origin.units <- match.arg(origin.units)
    origin.depth <- match.arg(origin.depth)
    # Argument checks
    if(units=="months" & depth=="years")
        stop("Conflict between \'units\' and \'depth\': set depth=\'months\'.")
    # Argument checks
    if(origin.units=="months" & origin.depth=="years")
        stop("Conflict between \'origin.units\' and \'origin.depth\'.")
    if(use.leap)
        total.days <- list(m=30.4375,y=365.25)
    else
        total.days <- list(m=30.41667,y=365)
    if(origin.units=="years") {
        years <- trunc(x)
        if(origin.depth=="days") {
            months <- ((x-years)*total.days$y)/total.days$m
            days <- months-trunc(months)
            months <- trunc(months)
            days <- trunc(days*total.days$m)
        } else {
            if(origin.depth=="months") {
                months <- (x-years)*12
                days <- 0
            }
        }
    } else {
        years <- trunc(x/12)
        months <- trunc(x%%12)
        if(origin.depth=="days")
            days <- trunc((x-trunc(x))*total.days$m)
        else
            days <- 0
    }
    years <- as.integer(round(years))
    months <- as.integer(round(months))
    days <- as.integer(round(days))
    if(units=="years") {
        years <- trunc(years)
        age.calc <- switch(depth,
            "days" = paste(years,months,days,sep=":"),
            "months" = paste(years,months,sep=":"),
            "years" = as.character(years)
        )
    } else
        age.calc <- switch(depth,
            "days" = paste(years*12+months,days,sep=":"),
            "months" = as.character(years*12+months)
        )
    age.calc[which(is.na(x))] <- NA
    return(age.calc)
}

age_segment <- function(x, breaks, labels=NULL, factor=TRUE)
{
    x <- age_numeric(x)
    breaks <- age_numeric(breaks)
    age.class <- findInterval(x,breaks,rightmost.closed=FALSE,left.open=FALSE)
    n.class <- length(breaks)-1
    age.class[which(age.class==0 | age.class>n.class)] <- NA
    if(!is.null(labels))
        age.class <- labels[age.class]
    if(factor)
        age.class <- factor(age.class,levels=labels)
    return(age.class)
}
