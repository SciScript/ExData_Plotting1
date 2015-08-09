# Read in the data and filter the dates
dat <- data.table::fread("household_power_consumption.txt")
dat1 <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
rm(dat)

# convert the Global_active_power variable into numeric
dat1$Global_active_power <- as.numeric(dat1$Global_active_power)

# Create a variable that combines the date and the time
dat1$Date_Time <- paste(dat1$Date, dat1$Time, sep = " ")
dat1$Date_Time <- dmy_hms(dat1$Date_Time)

# Create plot4
png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(dat1$Date_Time, dat1$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(dat1$Date_Time, dat1$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(dat1$Date_Time, dat1$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(dat1$Date_Time, dat1$Sub_metering_1, col = "black")
lines(dat1$Date_Time, dat1$Sub_metering_2, col = "red")
lines(dat1$Date_Time, dat1$Sub_metering_3, col = "blue")
legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=c(1,1,1), cex=0.9)
plot(dat1$Date_Time, dat1$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()