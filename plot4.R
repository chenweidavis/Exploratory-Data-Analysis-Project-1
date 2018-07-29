#reading data
data<- data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?"))

data_new<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

data_new[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

data$Global_active_power<-as.numeric(data$Global_active_power)

#Plot 
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

# Plot 1
plot(data_new[, dateTime], data_new[, Global_active_power], type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(data_new[, dateTime],data_new[, Voltage], type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(data_new[, dateTime], data_new[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(data_new[, dateTime], data_new[, Sub_metering_2], col="red")
lines(data_new[, dateTime], data_new[, Sub_metering_3],col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(data_new[, dateTime], data_new[,Global_reactive_power], type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
