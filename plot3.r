library(lubridate)

# Read in the data and filter the dates
dat <- data.table::fread("household_power_consumption.txt")
dat1 <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
rm(dat)

# convert the Global_active_power variable into numeric
dat1$Global_active_power <- as.numeric(dat1$Global_active_power)

# Create a variable that combines the date and the time
dat1$Date_Time <- paste(dat1$Date, dat1$Time, sep = " ")
dat1$Date_Time <- dmy_hms(dat1$Date_Time)

# Create plot3 (ATTENTION: my computer is in German, therefore the labels appear in German as
# Do, Fr Sa (= Thu, Fri, Sat))
png(filename="plot3.png", width = 480, height = 480)
plot(dat1$Date_Time, dat1$Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering")
lines(dat1$Date_Time, dat1$Sub_metering_1, col = "black")
lines(dat1$Date_Time, dat1$Sub_metering_2, col = "red")
lines(dat1$Date_Time, dat1$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty=c(1,1,1), cex=0.9)
dev.off()
