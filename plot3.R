all_data=read.table("household_power_consumption.txt", sep=";")
work_data = subset(all_data, all_data$V1 == "1/2/2007" | all_data$V1 == "2/2/2007")
names(work_data) = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

work_data$Sub_metering_1 <- as.numeric(work_data$Sub_metering_1)
work_data$Sub_metering_2 <- as.numeric(work_data$Sub_metering_2)
work_data$Sub_metering_3 <- as.numeric(work_data$Sub_metering_3)
work_data$Date <- as.character(work_data$Date)
work_data$Time <- as.character(work_data$Time)
DTime<-paste(work_data$Date, work_data$Time)
DTime<-strptime(DTime, "%d/%m/%Y %H:%M:%S")
work_data<-cbind(work_data, DTime)

with(work_data, plot(DTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(work_data, lines(DTime, Sub_metering_2, col = "red"))
with(work_data, lines(DTime, Sub_metering_3, col = "blue"))

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))

dev.copy(png, "plot3.png", height=430, width=480)
dev.off()
