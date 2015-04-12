# Getting and preparing data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data <- subset(data, data$Date == as.Date("07-02-01", "%y-%m-%d") | data$Date == as.Date("07-02-02", "%y-%m-%d"))

#Combining Date and Time
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Constructing the third plot and creating PNG file
png(filename="plot3.png", width=480, height=480)
with(data, {
  plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(Datetime, Sub_metering_2, col = "red")
  lines(Datetime, Sub_metering_3, col = "blue")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()