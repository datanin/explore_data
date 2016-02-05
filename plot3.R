library(dplyr) 

data<- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data2 <- filter(data, Date == "2007-02-01" | Date == "2007-02-02")

datetime <- paste(as.Date(data2$Date), data2$Time)
data2$Datetime <- as.POSIXct(datetime)

# Release memory
rm(data)
rm(datetime)

# Plot 3
with(data2, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
