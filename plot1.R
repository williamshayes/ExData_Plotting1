# Coursera - Exploratory Data Analysis - Course Project #1
# plot1.R

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


# Set plot device to png
png(file = "plot1.png", bg = "transparent",  width = 480, height = 480)

# Create plot
hist(power2007$Global_active_power, col="red",
                                    main="Global Active Power",
                                    xlab="Global Active Power (kilowatts)")


dev.off()  ## Don't forget to close the PNG device!