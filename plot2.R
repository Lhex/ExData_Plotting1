library(lubridate)

file <- "household_power_consumption.txt"
data <- read.csv(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
subdata <- data[dmy(data$Date) == dmy("01/02/2007") | dmy(data$Date) == dmy("02/02/2007"), ]
dateArray <- paste(subdata$Date, subdata$Time, sep = "_")

png(
    filename = "plot2.png",
    width = 480,
    height = 480,
    units = "px"
)

plot(dmy_hms(dateArray), subdata$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power(kilowatts)")

dev.off()