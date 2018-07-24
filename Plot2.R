## PLOT 2
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
png(filename = "./plot2.png", height = 480, width = 480)

## plots the Global Active Power vs. DateTime
plot(df$DateTime,df$Global_active_power,type="l", ylab = "GLobal Active Power (kilowatts)",xlab="")

## outputs the png file
dev.off()