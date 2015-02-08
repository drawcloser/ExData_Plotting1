household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric',  'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
household <- na.omit(household)
housedata <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]
housedata$Date <- strptime(paste(housedata$Date,housedata$Time), "%d/%m/%Y %H:%M:%S")
# make a png file and put the content in
png(filename = "Plot3.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(housedata$Date, housedata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(housedata$Date, housedata$Sub_metering_2, type = "l", col = "red")
lines(housedata$Date, housedata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 0.75)
dev.off()