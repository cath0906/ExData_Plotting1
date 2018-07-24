## PLOT 1
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
png(filename = "./plot1.png", height = 480, width = 480)

## plot a histogram on the values of Global Active Power
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## outputs the png file
dev.off()