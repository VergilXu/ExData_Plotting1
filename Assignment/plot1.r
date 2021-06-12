# 1
power_consumption <- read.table("C:/Users/Administrator/Desktop/household_power_consumption.txt", sep = ";", header = TRUE)
# subset data from dataframe where data is in "2007-02-01" and "2007-02-02"
power_consumption = subset(power_consumption, Date == "1/2/2007"|Date == "2/2/2007")
power_consumption$Global_active_power <- as.numeric(power_consumption$Global_active_power)
png("C:/Users/Administrator/Desktop/plot1.png", height = 480, width = 480)
hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

