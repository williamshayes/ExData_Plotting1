# Coursera - Exploratory Data Analysis - Course Project #1
# plot4.R

# Confirm correct starting directory
setwd("~/R/03-ExData/CP1")

# Read the data into a dataframe
power <- read.delim("household_power_consumption.txt", sep=";", na.strings="?")

# Convert the key columns to explicit date and time variables
library(lubridate)
power$Date <- dmy(power$Date)
power$Time <- hms(power$Time)

# Create a subsetted matrix consistent with the indicated time frame
power2007 <- power[year(power$Date) == 2007 & 
                   month(power$Date) == 2 &
                   (day(power$Date) == 1 | day(power$Date) ==2),]

# Combine the Date and time into one variable
power2007$DateTime <- power2007$Date + power2007$Time


# Set plot device to png
png(file = "plot4.png", bg = "transparent",  width = 480, height = 480)

# Create plot
par(mfcol = c(2, 2))

# Subplot #1
with(power2007, plot(DateTime,Global_active_power, type="l",
                     xlab="",
                     ylab="Global Active Power"))

# Subplot #2
with(power2007, plot(DateTime,Sub_metering_1, type="l",
                     xlab="",
                     ylab="Energy sub metering"),
     col="black")
with(power2007, lines(DateTime, Sub_metering_2, col="red"))
with(power2007, lines(DateTime, Sub_metering_3, col="blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1, bty = "n")

# Subplot #3
with(power2007, plot(DateTime, Voltage, type="l", xlab="datetime"))

# Subplot #4
with(power2007, plot(DateTime, Global_reactive_power, type="l", 
                     xlab="datetime"))

dev.off()  ## Don't forget to close the PNG device!