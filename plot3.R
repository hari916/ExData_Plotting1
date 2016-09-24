###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 3
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

png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
