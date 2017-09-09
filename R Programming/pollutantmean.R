pollutantmean <- function(directory, pollutant, id=1:332) {
    total=0
    count=0
    for(i in id) {
        fileName <- paste(directory,"/",sprintf("%03d", i),".csv", sep = "")
        print(fileName)
        frame <- read.csv(fileName)
        field <- frame[[pollutant]]
        valField <- field[!is.na(field)]
        s <- sum(valField)
        count=count+length(valField)
        total=total+s;
    }
    total/count
}