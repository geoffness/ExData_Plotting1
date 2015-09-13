## Code to read household energy consumption data then plot a histogram of global active power
## Note: downloads zip archive directly into working directory then unzips and creates plot
## Later plots do not repeat the download process but assume the text file is present

# Download and unzip data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "exdata%2Fdata%2Fhousehold_power_consumption.zip")
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Read and format
FebData <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),sep = ";")
header <- readLines("household_power_consumption.txt",n = 1)
names(FebData) <- strsplit(header,";")[[1]]
FebData$datetime <- strptime(paste(FebData$Date,FebData$Time),"%d/%m/%Y %H:%M:%S")
FebData$weekday <- format(FebData$datetime,"%a")

# Output histogram to png file dest
png(filename = "plot1.png")
hist(FebData$Global_active_power,col = "red",main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()