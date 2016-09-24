###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 4
###############################################
epcFile <- "household_power_consumption.txt"
epcdata <- read.table(epcFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset 
epcFebData <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]
#datetime
datetime <- strptime(paste(epcFebData$Date, epcFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(epcFebData$Global_active_power)
subMeter1 <- as.numeric(epcFebData$Sub_metering_1)
subMeter2 <- as.numeric(epcFebData$Sub_metering_2)
subMeter3 <- as.numeric(epcFebData$Sub_metering_3)
voltage <- as.numeric(epcFebData$Voltage)
globalReactivePower <- as.numeric(epcFebData$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()