fullData <- read.delim("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE)
rowDates <- as.Date(strptime(fullData[,"Date"], "%d/%m/%Y"))
plotData <- fullData[rowDates == as.Date("2007-02-02") | rowDates == as.Date("2007-02-01"),]

hist(as.numeric(plotData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()