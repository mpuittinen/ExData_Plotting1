fullData <- read.delim("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE)
fullData$dateTime <- strptime(paste(fullData$Date, fullData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plotData <- fullData[as.Date(fullData$dateTime) == as.Date("2007-02-02") | as.Date(fullData$dateTime) == as.Date("2007-02-01"),]

plot(plotData$dateTime, plotData$Sub_metering_1,  type="l", main="", xlab="", ylab="Energy sub metering")
lines(plotData$dateTime, plotData$Sub_metering_2, col="red")
lines(plotData$dateTime, plotData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"))
dev.copy(png, "plot3.png", width=480, height=480, units="px")
dev.off()