all_data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na="?", colClasses=c(rep("character", 2), rep("numeric", 7)))

work_data = subset(all_data, all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007")
work_data$Date <- as.character(work_data$Date)
work_data$Time <- as.character(work_data$Time)
DTime<-paste(work_data$Date, work_data$Time)
DTime<-strptime(DTime, "%d/%m/%Y %H:%M:%S")
work_data<-cbind(work_data, DTime)

with(work_data, plot(DTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

dev.copy(png, "plot2.png", height=430, width=480)
dev.off()
