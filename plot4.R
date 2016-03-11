#Read the data
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#Change the Date column to a Date object
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
#Change the Time column to a Time object
data$Time = strptime(data$Time, format = "%H:%M:%S")
#Subset the set
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

#Plot 4
windows()
par(mfrow = c(2, 2))
plot(data2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", xaxt="n")
axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, nrow(data2)/2, nrow(data2)))

plot(data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", xaxt="n")
axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, nrow(data2)/2, nrow(data2)))

plot(data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub mettering", xaxt="n")
lines(data2$Sub_metering_2, col = "red")
lines(data2$Sub_metering_3, col = "blue")
axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, nrow(data2)/2, nrow(data2)))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", col=c("black","red","blue"), cex = .8,lty=c(1,1,1))

plot(data2$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", xaxt="n")
axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, nrow(data2)/2, nrow(data2)))

#Save plot as PNG
dev.copy(png, file = "plot4.png")
dev.off()