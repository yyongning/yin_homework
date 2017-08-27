all_data=read.table("household_power_consumption.txt", sep=";")
work_data = subset(all_data, all_data$V1 == "1/2/2007" | all_data$V1 == "2/2/2007")
names(work_data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

work_data$Global_active_power <- as.numeric(work_data$Global_active_power)
work_data$Date <- as.character(work_data$Date)
work_data$Time <- as.character(work_data$Time)
DTime<-paste(work_data$Date, work_data$Time)
DTime<-strptime(DTime, "%d/%m/%Y %H:%M:%S")
work_data<-cbind(work_data, DTime)

with(work_data, plot(DTime, Global_active_power/1000, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, "plot2.png", height=430, width=480)
dev.off()