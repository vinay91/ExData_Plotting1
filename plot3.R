##Note: Make sure that "household_power_consumption.txt" is in your working directory.

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y") 
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png(filename = 'Plot3.png', width = 480, height = 480, units = 'px')

with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Enegy Sub Metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.off()