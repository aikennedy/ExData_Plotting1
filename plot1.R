## Load and process data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

data$DateTime <- strptime(paste0(data$Date, "-", data$Time), format = "%d/%m/%Y-%H:%M:%S")

start <- strptime("01/02/2007-00:00:00", format = "%d/%m/%Y-%H:%M:%S")
finish <- strptime("03/02/2007-00:00:00", format = "%d/%m/%Y-%H:%M:%S")

data <- data[data$DateTime >= start & data$DateTime < finish & !is.na(data$DateTime), ]

## Create histogram
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     col = "Red")
dev.off()