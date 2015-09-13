## Code to read household energy consumption data then plot a time series of global active power
## Note: assumes presence of file "household_power_consumption.txt" in working directory

# Read and format
FebData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep = ";")
header <- readLines("household_power_consumption.txt",n = 1)
names(FebData) <- strsplit(header,";")[[1]]
FebData$datetime <- strptime(paste(FebData$Date,FebData$Time),"%d/%m/%Y %H:%M:%S")
FebData$weekday <- format(FebData$datetime,"%a")

# Output line plot to png file dest
png(filename = "plot2.png")
plot(FebData$datetime,FebData$Global_active_power,type = "l",
     xlab = "",ylab = "Global Active Power (kilowatts)")
dev.off()