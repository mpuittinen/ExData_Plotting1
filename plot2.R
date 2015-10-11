fullData <- read.delim("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE)
fullData$dateTime <- strptime(paste(fullData$Date, fullData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plotData <- fullData[as.Date(fullData$dateTime) == as.Date("2007-02-02") | as.Date(fullData$dateTime) == as.Date("2007-02-01"),]

plot(plotData$dateTime, as.numeric(plotData$Global_active_power), type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()