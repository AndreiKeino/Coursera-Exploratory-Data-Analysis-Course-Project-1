# Coursera Exploratory Data Analysis Course Project 1

# this script plot1.R creates the Global Activity Power histogram


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

# plot Global_active_power vs. time
plot(hhpc$dt, hhpc$Global_active_power, type="n", main='Plot 2', xlab = '', ylab = 'Global Active Power (kilowatts)')
lines(hhpc$dt, hhpc$Global_active_power)

#copy to a file
dev.copy(png, 'plot2.png')

#close device
dev.off()