temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp)
consData <- read.table(unz(temp, "household_power_consumption.txt"), 
                       sep = ";", 
                       header = TRUE, 
                       colClasses = c("character", "character", rep("numeric", 7)), 
                       na.strings = c("?"), 
                       dec = ".",
                       comment.char = "")
unlink(temp)
rm(temp)

data2 <- consData[consData$Date %in% c('1/2/2007', '2/2/2007'),]


Sys.setlocale("LC_TIME", "English")
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
with(data2, {plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")})
dev.off()
