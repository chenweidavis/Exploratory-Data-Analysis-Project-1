#reading data
data<- data.table(read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings="?"))

as.Date(data$Date,"%d/%m/%Y")

data_new<-subset(data, Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power<-as.numeric(data$Global_active_power)

#Plot 

png("plot1.png", width=480, height=480)

with(data_new,hist(Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red"))

dev.off()
