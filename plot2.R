# Getting and preparing data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data <- subset(data, data$Date == as.Date("07-02-01", "%y-%m-%d") | data$Date == as.Date("07-02-02", "%y-%m-%d"), na.rm = TRUE)

#Combining Date and Time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Constructing the second plot and creating PNG file
png(filename="plot2.png", width=480, height=480)
plot(data$Global_active_power ~ data$Datetime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()