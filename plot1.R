fullData <- read.delim("household_power_consumption.txt",sep=";", stringsAsFactors=FALSE)
fullData$dateTime <- strptime(paste(fullData$Date, fullData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plotData <- fullData[as.Date(fullData$dateTime) == as.Date("2007-02-02") | as.Date(fullData$dateTime) == as.Date("2007-02-01"),]
par(mfrow=c(1,1))
hist(as.numeric(plotData$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", cex.axis=0.75, cex.lab=0.75)
dev.copy(png, "plot1.png", width=480, height=480, units="px")
dev.off()