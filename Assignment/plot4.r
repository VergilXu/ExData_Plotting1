# 4
library(dplyr)
library(lubridate)
library(tidyr)
power_consumption <- read.table("C:/Users/Administrator/Desktop/household_power_consumption.txt", sep = ";", header = TRUE)
# subset data from dataframe where data is in "2007-02-01" and "2007-02-02"
power_consumption = subset(power_consumption, Date == "1/2/2007"|Date == "2/2/2007")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
power_consumption <- unite(power_consumption, "time", c(Date, Time), sep = (" "))
power_consumption$time <- dmy_hms(power_consumption$time)

# using Gather function to split the columns of sub_metering
temp_df <- select(power_consumption, time, Sub_metering_1, Sub_metering_2, Sub_metering_3)
temp_df <- gather(temp_df, sub_metering, value, -time)

# with(power_consumption, plot(time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
# with(power_consumption, plot(time, Global_reactive_power, type = "h", xlab = "datetime", ylab = "Global_reactive_power"))
png("C:/Users/Administrator/Desktop/plot4.png", height = 480, width = 480)
par(mfrow = c(2,2))
# plot 1
with(power_consumption, plot(time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
# plot 2
with(power_consumption, plot(time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
# plot 3
with(temp_df, plot(time, value, xlab = "", ylab = "Energy sub metering", type = "l"))
with(subset(temp_df, sub_metering == "Sub_metering_1"), lines(time, value, col = "black"))
with(subset(temp_df, sub_metering == "Sub_metering_2"), lines(time, value, col = "red"))
with(subset(temp_df, sub_metering == "Sub_metering_3"), lines(time, value, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = "solid", col = c("black", "red", "blue"))
# plot 4
with(power_consumption, plot(time, Global_reactive_power, type = "h", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()