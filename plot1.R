###############################################
#Exploratory Data Analysis - Course Project 1
#Plot 1
###############################################
epcdata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#subset 
epcFebData <- epcdata[epcdata$Date %in% c("1/2/2007","2/2/2007") ,]
#coerse to numeric
GlobalActivePower <- as.numeric(subSetData$Global_active_power)
#open device
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
