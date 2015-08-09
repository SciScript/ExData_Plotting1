# Read in the data and filter the dates
dat <- data.table::fread("household_power_consumption.txt")
dat1 <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
rm(dat)

# convert the Global_active_power variable into numeric
dat1$Global_active_power <- as.numeric(dat1$Global_active_power)

# Create a variable that combines the date and the time
dat1$Date_Time <- paste(dat1$Date, dat1$Time, sep = " ")
dat1$Date_Time <- dmy_hms(dat1$Date_Time)

# Create plot2
png(filename="plot2.png", width = 480, height = 480)
with(dat1, plot(Date_Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()