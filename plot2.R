###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 2
###############################################
epcFile <- "household_power_consumption.txt"
epcdata <- read.table(epcFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset 
epcFebData <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]
#coerse to numeric

datetime <- strptime(paste(epcFebData$Date, epcFebData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(epcFebData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
