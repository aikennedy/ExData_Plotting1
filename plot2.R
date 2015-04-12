## Load and process data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

data$DateTime <- strptime(paste0(data$Date, "-", data$Time), format = "%d/%m/%Y-%H:%M:%S")

start <- strptime("01/02/2007-00:00:00", format = "%d/%m/%Y-%H:%M:%S")
finish <- strptime("03/02/2007-00:00:00", format = "%d/%m/%Y-%H:%M:%S")

data <- data[data$DateTime >= start & data$DateTime < finish & !is.na(data$DateTime), ]


## Create time series plot
png(filename = "plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

