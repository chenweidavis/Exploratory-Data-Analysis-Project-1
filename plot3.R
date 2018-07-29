#reading data
data<- data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?"))

data_new<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

data_new[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

data$Global_active_power<-as.numeric(data$Global_active_power)

#Plot 
png("plot3.png", width=480, height=480)

plot(data_new[, dateTime], data_new[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")

lines(data_new[, dateTime], data_new[, Sub_metering_2],col="red")

lines(data_new[, dateTime], data_new[, Sub_metering_3],col="blue")

legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), 
       lwd=c(1,1))

dev.off()
