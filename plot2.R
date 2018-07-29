#reading data
data<- data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?"))

data_new<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

data_new[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

data$Global_active_power<-as.numeric(data$Global_active_power)

#Plot 
png("plot2.png", width=480, height=480)

plot(x = data_new[, dateTime], y = data_new[, Global_active_power], type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
