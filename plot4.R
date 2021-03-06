all_data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?", colClasses=c(rep("character", 2), rep("numeric", 7)))

work_data = subset(all_data, all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007")

work_data$Date <- as.character(work_data$Date)
work_data$Time <- as.character(work_data$Time)
DTime<-paste(work_data$Date, work_data$Time)
DTime<-strptime(DTime, "%d/%m/%Y %H:%M:%S")
work_data<-cbind(work_data, DTime)

par(mfrow = c(2,2))

with(work_data, plot(DTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
with(work_data, plot(DTime, Voltage, type="l", ylab="Voltage", xlab="datetime"))
with(work_data, plot(DTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(work_data, lines(DTime, Sub_metering_2, col = "red"))
with(work_data, lines(DTime, Sub_metering_3, col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"))
with(work_data, plot(DTime, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime"))

dev.copy(png, "plot4.png", height=430, width=480)
dev.off()
