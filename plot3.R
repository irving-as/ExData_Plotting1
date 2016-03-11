#Read the data
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#Change the Date column to a Date object
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
#Change the Time column to a Time object
data$Time = strptime(data$Time, format = "%H:%M:%S")
#Subset the set
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

#Plot 3
par(mfrow = c(1, 1))
plot(data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub mettering", xaxt="n")
lines(data2$Sub_metering_2, col = "red")
lines(data2$Sub_metering_3, col = "blue")
axis(side = 1, labels = c("Thu", "Fri", "Sat"), at = c(0, nrow(data2)/2, nrow(data2)))
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, pt.cex = 0.1, cex = .8, y.intersp=0.3)

#Save plot as PNG
dev.copy(png, file = "plot3.png")
dev.off()