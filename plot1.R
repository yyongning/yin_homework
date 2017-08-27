all_data=read.table("household_power_consumption.txt", sep=";")
work_data = subset(all_data, all_data$V1 == "1/2/2007" | all_data$V1 == "2/2/2007")
names(work_data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

work_data$Global_active_power <- as.numeric(work_data$Global_active_power)
hist(work_data$Global_active_power/1000, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, "plot1.png", height=430, width=480)
dev.off()