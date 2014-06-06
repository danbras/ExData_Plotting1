#Read data
power=read.csv("~/Downloads/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)
#Create a Date/Time Variable and Convert Format
power$DateTime=strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
#Use only two days worth of data
power=subset(power,power$DateTime>=as.POSIXlt("2007-02-01 00:00:00")&power$DateTime<as.POSIXlt("2007-02-03 00:00:00"))
#Plot1
png(file="~/Downloads/plot1.png")
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)
")
dev.off()