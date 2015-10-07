# Assumption is that household_power_consumption.txt is present in current dir
# Uncomment the following if file is not present in current dir
# temp <- tempfile()
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, method="curl")
# data <- read.csv(unz(temp,"household_power_consumption.txt"), sep = ";", header = TRUE, 
#                  colClasses = c("character", "character", rep("numeric", 7)), 
#                  na.strings=c("?"))

data <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, 
                 colClasses = c("character", "character", rep("numeric", 7)), 
                 na.strings=c("?"))
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
plotdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot1.png", width = 480, height = 480)
hist(plotdata$Global_active_power, main="Global Active Power", col="red",  xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()