all_data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?", colClasses=c(rep("character", 2), rep("numeric", 7)))

work_data = subset(all_data, all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007")
hist(work_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, "plot1.png", height=430, width=480)
dev.off()
