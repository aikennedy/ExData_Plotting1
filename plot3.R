## Load and process data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)

data$DateTime <- strptime(paste0(data$Date, "-", data$Time), format = "%d/%m/%Y-%H:%M:%S")

start <- strptime("01/02/2007-00:00:00", format = "%d/%m/%Y-%H:%M:%S")
finish <- strptime("03/02/2007-00:00:00", format = "%d/%m/%Y-%H:%M:%S")

data <- data[data$DateTime >= start & data$DateTime < finish & !is.na(data$DateTime), ]


## Create multiline plot
png(filename = "plot3.png", width = 480, height = 480)
ylims <- range(c(data$Sub_metering_1,data$Sub_metering_2,data$Sub_metering_3))
plot(data$DateTime, data$Sub_metering_1, type = "l", col = "black",
     ylim = ylims, xlab = "", ylab = "Energy sub metering")
par(new = TRUE)
plot(data$DateTime, data$Sub_metering_2, type = "l", col = "red",
     ylim = ylims, axes = FALSE, xlab = "", ylab = "")
par(new = TRUE)
plot(data$DateTime, data$Sub_metering_3, type = "l", col = "blue",
     ylim = ylims, axes = FALSE, xlab = "", ylab = "")
legend("topright", lty = c(1,1), col=c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

