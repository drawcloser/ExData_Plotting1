household <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c('character', 'character', 'numeric',  'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
household <- na.omit(household)
housedata <- household[household$Date %in% c("1/2/2007", "2/2/2007"),]
housedata$Date <- strptime(paste(housedata$Date,housedata$Time), "%d/%m/%Y %H:%M:%S")
# make a png file and put the content in
png(filename = "Plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(housedata$Date, housedata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()