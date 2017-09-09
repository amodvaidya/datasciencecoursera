complete <- function(directory, id=1:332) {
    dat <- data.frame("id"=numeric(),"nobs"=numeric())
    for(i in id) {
        fileName <- paste(directory,"/",sprintf("%03d", i),".csv", sep = "")
        frame <- read.csv(fileName)
        #count <- length(r[(!is.na(frame$sulfate))&(!is.na(frame$nitrate))])
        frame <- frame[complete.cases(frame),]
        dat[nrow(dat) + 1,] = list(i,nrow(frame))
    }
    dat
}