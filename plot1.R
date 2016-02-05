# Check if file is already downloaded 
if(!file.exists("household_power_consumption.txt")) {
    unzip("exdata_data_household_power_consumption.zip")  
}

# Load the data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

# Check the data
head(data)
str(data)

# Format the date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter two days
twoDays <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02" ,]

# Combine date and time 
dateTime <- paste(as.Date(twoDays$Date), twoDays$Time)

# Formate date and time
twoDays$Time <- strptime(dateTime, "%Y-%m-%d %H:%M:%S")

# Plot the histogramm
hist(twoDays$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency" , main = "Global Active Power")

# Save to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
