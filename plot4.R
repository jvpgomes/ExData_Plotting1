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
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow = c(2, 2))
with(data2, {plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
             plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
             plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"),  Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
             lines(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "red")
             lines(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "blue")
             legend("topright", lty = 1, col = c("black", "blue", "red"), bty = "n", cex = 0.9, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
             plot(as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), Global_reactive_power, type = "l", xlab = "datetime")})
dev.off()
