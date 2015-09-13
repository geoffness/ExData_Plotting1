## Code to read household energy consumption data then plot energy sub metering
## Note: assumes presence of file "household_power_consumption.txt" in working directory

# Read and format
FebData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep = ";")
header <- readLines("household_power_consumption.txt",n = 1)
names(FebData) <- strsplit(header,";")[[1]]
FebData$datetime <- strptime(paste(FebData$Date,FebData$Time),"%d/%m/%Y %H:%M:%S")
FebData$weekday <- format(FebData$datetime,"%a")

# Output line plots to png file dest
png(filename = "plot3.png")
plot(FebData$datetime,FebData$Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = "")
lines(FebData$datetime,FebData$Sub_metering_2,col="red")
lines(FebData$datetime,FebData$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty = c(1,1,1))
dev.off()