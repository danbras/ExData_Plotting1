#Read data
power=read.csv("~/Downloads/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
#Create a Date/Time Variable and Convert Format
power$DateTime=strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
#Use only two days worth of data
power=subset(power,power$DateTime>=as.POSIXlt("2007-02-01 00:00:00")&power$DateTime<as.POSIXlt("2007-02-03 00:00:00"))
#Plot 4
png(file="~/Downloads/plot4.png")
par(mfrow=c(2,2))
plot(power$DateTime,power$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(power$DateTime,power$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(power$DateTime,power$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="")
lines(power$DateTime,power$Sub_metering_1)
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=.75)
plot(power$DateTime,power$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()