## PLOT 4
##Author: CAJasareno

## ----------------------------------------------------------------------------------------------
## Save this R script in the folder where household_power_consumption.txt is saved
## Also, make sure that you have an installed sqldf package since it will be used to read the data
## ----------------------------------------------------------------------------------------------

library(sqldf)

## read the data but select only the dates specified in the instructions
df <- read.csv.sql("household_power_consumption.txt","select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";")

## create a new field in datetime format
df$DateTime <- strptime(paste(df$Date,df$Time),format="%d/%m/%Y %H:%M:%S")

## start PNG device driver for saving output
png(filename = "./plot4.png", height = 480, width = 480)

## sets the plot area into 2 rows and 2 columns
par(mfrow = c(2,2))

## 1st plot global active power by datetime
plot(df$DateTime,df$Global_active_power,type="l", ylab = "GLobal Active Power",xlab="")

## 2nd plot voltage by datetime
plot(df$DateTime, df$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## 3rd plot types of sub-metering by datetime
plot(df$DateTime, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab= "")
lines(df$DateTime,df$Sub_metering_2, type = "l", col = "red")
lines(df$DateTime,df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, bty = "n", cex = 0.75)

## 4th plot global reactive power by datetime
plot(df$DateTime, df$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

## outputs the png file
dev.off()