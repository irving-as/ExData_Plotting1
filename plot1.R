#Read the data
data <- read.table(file = "household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)
#Change the Date column to a Date object
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
#Change the Time column to a Time object
data$Time = strptime(data$Time, format = "%H:%M:%S")
#Subset the set
data2 <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

#Plot 1
par(mfrow = c(1, 1))
hist(data2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

#Save plot as PNG
dev.copy(png, file = "plot1.png")
dev.off()