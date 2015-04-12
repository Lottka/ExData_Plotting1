# Getting and preparing data set
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date <- as.Date(data$Date , "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")
data <- subset(data, data$Date == as.Date("07-02-01", "%y-%m-%d") | data$Date == as.Date("07-02-02", "%y-%m-%d"))

#Constructing the frist plot
plot1 <- hist(data$Global_active_power)

#Creating PNG file
png(filename="plot1.png", width=480, height=480)
plot(plot1,  main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()