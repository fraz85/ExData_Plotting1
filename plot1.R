library(dplyr)
library(lubridate)


# Read data
epc <- read.table("./Datasets/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Create datetime, convert measurements to numeric

epc <- epc %>% mutate(Datetime=dmy_hms(paste(Date, Time)),
                      Global_active_power    = as.numeric(Global_active_power),
                      Global_reactive_power  = as.numeric(Global_reactive_power),
                      Voltage                = as.numeric(Voltage),
                      Global_intensity       = as.numeric(Global_intensity),
                      Sub_metering_1         = as.numeric(Sub_metering_1),
                      Sub_metering_2         = as.numeric(Sub_metering_2),
                      Sub_metering_3         = as.numeric(Sub_metering_3))

# Convert date
epc <- epc %>% mutate(Date = dmy(Date))

# Filter date range
epc <- epc %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot....

# Open PNG Device 
png("plot1.png",width = 480, height = 480)

# Construct plot
hist(epc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Device off
dev.off()