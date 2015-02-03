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

png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
h <- hist(data2$Global_active_power)
plot(h, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()
