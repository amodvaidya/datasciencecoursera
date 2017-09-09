corr <- function(directory, thresold=0) {
    fileCount <- length(dir(directory))
    compData <- complete(directory, 1:fileCount)
    threData <- compData[compData$nobs>thresold,]
    corrVec <- numeric()
    for(id in threData$id){
        fileName <- paste(directory,"/",sprintf("%03d", id),".csv", sep = "")
        frame <- read.csv(fileName)
        frame <- frame[complete.cases(frame),]
        #now compute correlation and store
        corrVec <- append(corrVec, cor(frame$nitrate, frame$sulfate))
    }
    #browser()
    corrVec
}