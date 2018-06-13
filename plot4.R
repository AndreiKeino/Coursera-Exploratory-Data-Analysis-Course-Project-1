# Coursera Exploratory Data Analysis Course Project 1

# set working directory
setwd("D:\\Coursera\\Data_Science_Specialization\\04 -  Exploratory Data Analysis\\Week_1\\Course Project 1")

if(!exists('hhpc'))
{
    # read the table
    hhpc <- read.table('household_power_consumption.txt', sep =";", na.strings = '?', header = T, stringsAsFactors = F)
    # get the part of table corresponding to the dates 2007-02-01 and 2007-02-02
    hhpc <- hhpc[(hhpc$Date == '1/2/2007' | hhpc$Date == '2/2/2007'), ]
    # remove NA
    hhpc <- hhpc[complete.cases(hhpc), ]
    # paste date and time
    hhpc$DateTime <- paste(hhpc$Date, hhpc$Time)
    # convert datetime string to datetime class 
    hhpc$dt <- strptime(hhpc$DateTime, "%d/%m/%Y %H:%M:%S")
}

# setting up the 2x2 plot 
par(mfrow=c(2,2))
# first plot 
plot(hhpc$dt, hhpc$Global_active_power, type="l", xlab = '', ylab = 'Global Active Power')
# second plot
plot(hhpc$dt, hhpc$Voltage, type="l", xlab = '', ylab = 'Voltage')
# third plot
plot(hhpc$dt,  hhpc$Sub_metering_1, type="n", xlab = 'datetime', ylab = 'Energy sub metering')
lines(hhpc$dt, hhpc$Sub_metering_1)
lines(hhpc$dt, hhpc$Sub_metering_2, col = 'red')
lines(hhpc$dt, hhpc$Sub_metering_3, col = 'blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = c(1, 1, 1))
# 4 - th plot
plot(hhpc$dt,  hhpc$Global_reactive_power, type="n", xlab = 'datetime', ylab = 'Global_reactive_power')
lines(hhpc$dt, hhpc$Global_reactive_power)

mtext("Plot 4", side=3, outer=TRUE, line=-2)


#copy to a file
dev.copy(png, 'plot4.png')

#close device, reload the grafics default parameters
dev.off()