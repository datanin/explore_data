library(dplyr) 
data<- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

# Release memory
rm(data)
rm(datetime)

# Plot 2
plot(data2$Global_active_power ~ data2$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

# Save to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
