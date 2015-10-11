fullData <- read.delim("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE)
fullData$dateTime <- strptime(paste(fullData$Date, fullData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plotData <- fullData[as.Date(fullData$dateTime) == as.Date("2007-02-02") | as.Date(fullData$dateTime) == as.Date("2007-02-01"),]

par(mfrow=c(2,2))
plot(plotData$dateTime, as.numeric(plotData$Global_active_power), type="l", main="", xlab="", ylab="Global Active Power (kilowatts)", cex.axis=0.75, cex.lab=0.75)
plot(plotData$dateTime, as.numeric(plotData$Voltage), type="l", main="", xlab="datetime", ylab="Voltage", cex.axis=0.75, cex.lab=0.75)
plot(plotData$dateTime, plotData$Sub_metering_1,  type="l", main="", xlab="", ylab="Energy sub metering", cex.axis=0.75, cex.lab=0.75)
lines(plotData$dateTime, plotData$Sub_metering_2, col="red")
lines(plotData$dateTime, plotData$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col=c("black", "red", "blue"), bty="n", cex=0.75, y.intersp=0.75)
plot(plotData$dateTime, as.numeric(plotData$Global_reactive_power), type="l", main="", xlab="datetime", ylab="Global_reactive_power", cex.axis=0.75, cex.lab=0.75)
dev.copy(png, "plot4.png", width=480, height=480, units="px")
dev.off()