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

data$datetime <-paste(data$Date, data$Time) #, "%Y-%m-%d %H:%M:%S")

plotdata <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
png("plot3.png", width = 480, height = 480)
plot(strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S"), plotdata$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S"), plotdata$Sub_metering_1, col = "black")
lines(strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S"), plotdata$Sub_metering_2, col = "red")
lines(strptime(plotdata$datetime, "%Y-%m-%d %H:%M:%S"), plotdata$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(1,1,1), col=c("black", "red", "blue"))
dev.off()