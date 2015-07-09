library(lubridate)

file <- "household_power_consumption.txt"
data <- read.csv(file, na.strings = "?", sep = ";", stringsAsFactors = FALSE)
subdata <- data[dmy(data$Date) == dmy("01/02/2007") | dmy(data$Date) == dmy("02/02/2007"), ]

png(
    filename = "plot1.png",
    width = 480,
    height = 480,
    units = "px"
)

hist(subdata$Global_active_power, col = "red", ylab = "Frequency",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()



