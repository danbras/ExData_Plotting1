#Read data
power=read.csv("~/Downloads/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#Convert to Date format
power$Date=as.Date(power$Date,"%d/%m/%Y")
#Use only two days worth of data
power=subset(power,power$Date>="2007-02-01"&power$Date<="2007-02-02")
#Histogram
png(file="~/Downloads/hist.png")
hist(power$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)
")
dev.off()