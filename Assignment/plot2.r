# 2
library(dplyr)
library(lubridate)
library(tidyr)
power_consumption <- read.table("C:/Users/Administrator/Desktop/household_power_consumption.txt", sep = ";", header = TRUE)
# subset data from dataframe where data is in "2007-02-01" and "2007-02-02"
power_consumption = subset(power_consumption, Date == "1/2/2007"|Date == "2/2/2007")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
power_consumption <- unite(power_consumption, "time", c(Date, Time), sep = (" "))
power_consumption$time <- dmy_hms(power_consumption$time)
png("C:/Users/Administrator/Desktop/plot2.png", height = 480, width = 480)
plot(power_consumption$time, power_consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()