library(lubridate)

file <- "household_power_consumption.txt"
data <- read.csv(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
subdata <- data[dmy(data$Date) == dmy("01/02/2007") | dmy(data$Date) == dmy("02/02/2007"), ]
dateArray <- paste(subdata$Date, subdata$Time, sep = "_")

png(
    filename = "plot4.png",
    width = 480,
    height = 480,
    units = "px"
)

par( mfrow = c(2,2))

plot(dmy_hms(dateArray), subdata$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power"
)

plot(dmy_hms(dateArray), subdata$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage"
)

plot(dmy_hms(dateArray), subdata$Sub_metering_1, 
     type = "l",
     col = "black",
     xlab = "", 
     ylab = "Energy sub metering"
)
lines(dmy_hms(dateArray), subdata$Sub_metering_2, 
      #type = "l",
      col = "red"
)
lines(dmy_hms(dateArray), subdata$Sub_metering_3, 
      #type = "l", 
      col = "blue"
)
legend("topright",
       lwd = c(1,1,1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n"
)

plot(dmy_hms(dateArray), subdata$Global_reactive_power, 
     type = "l", 
     xlab = "datetime",
     ylab = "Global_reactive_power",
     lwd = "0.01"
)

dev.off()