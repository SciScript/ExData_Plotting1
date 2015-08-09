# Read in the data and filter the dates
dat <- data.table::fread("household_power_consumption.txt")
dat1 <- filter(dat, Date == "1/2/2007" | Date == "2/2/2007")
rm(dat)

# convert the Global_active_power variable into numeric
dat1$Global_active_power <- as.numeric(dat1$Global_active_power)

# Create a variable that combines the date and the time
dat1$Date_Time <- paste(dat1$Date, dat1$Time, sep = " ")
dat1$Date_Time <- dmy_hms(dat1$Date_Time)

# Create the histogram
png(filename="plot1.png", width = 480, height = 480)
hist(dat1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()